library graphql_generator;

import 'dart:convert' as JSON;

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:http/http.dart' as http;
import 'package:source_gen/source_gen.dart';

import 'annotation.dart';
import 'model.dart';

class GraphQLGenerator extends GeneratorForAnnotation<GQLGenerator> {
  var url;
  var headerToken;
  var namespace;

  Map<String, Class> classes = {};
  List<String> enumString = [];

  List<TypeA> enumTypes = [];
  List<TypeA> interfaceTypes = [];
  List<TypeA> unionTypes = [];
  List<TypeA> objectTypes = [];
  List<TypeA> inputObjectTypes = [];
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    url = annotation.read('url').stringValue;
    headerToken = annotation.read('headerToken').stringValue;
    namespace = annotation.read('namespace').stringValue;

    var response = await getSchema();
    List<TypeA> typesFromResponse = getTypeList(getTypesFromResponse(response));
    enumTypes =
        typesFromResponse.where((type) => type.kind == Kind.ENUM).toList();
    parseEnumType(enumTypes);
    interfaceTypes =
        typesFromResponse.where((type) => type.kind == Kind.INTERFACE).toList();
    parseInterface(interfaceTypes);
    unionTypes =
        typesFromResponse.where((type) => type.kind == Kind.UNION).toList();
    parseUnion(unionTypes);
    inputObjectTypes =
        typesFromResponse.where((type) => type.kind == Kind.INPUT_OBJECT)
            .toList();
    parseInputObjectTypes(inputObjectTypes);
    objectTypes =
        typesFromResponse.where((type) => type.kind == Kind.OBJECT).toList();
    parseObjectType(objectTypes);

    ///Concat and return the String value back.
    var result = '';
    var emitter = DartEmitter();
    classes.forEach((className, classObject) {
      result += DartFormatter().format('${classObject.accept(emitter)}');
    });
    enumString.forEach((enumString) {
      result += DartFormatter().format(enumString);
    });
    return result;
  }

  /// Fetch the schema from the given url and header.
  Future<http.Response> getSchema() async {
    http.Response response = await new http.Client()
        .post(url,
            headers: headerToken != null
                ? {
                    'Content-type': 'application/json',
                    'Authorization': headerToken
                  }
                : {'Content-type': 'application/json'},
            body:
                '{"query" : "fragment FullType on __Type { kind name description fields(includeDeprecated: true) { name description args { ...InputValue } type { ...TypeRef } isDeprecated deprecationReason } inputFields { ...InputValue } interfaces { ...TypeRef } enumValues(includeDeprecated: true) { name description isDeprecated deprecationReason } possibleTypes { ...TypeRef } } fragment InputValue on __InputValue { name description type { ...TypeRef } defaultValue } fragment TypeRef on __Type { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name } } } } } } } } query IntrospectionQuery { __schema { queryType { name } mutationType { name } types { ...FullType } directives { name description locations args { ...InputValue } } } } "}')
        .whenComplete(() => print('completed'));
    return response;
  }

  /// Get all the types array from the response.
  List<dynamic> getTypesFromResponse(http.Response response) {
    Map<String, dynamic> json = JSON.jsonDecode(response.body);
    Map<String, dynamic> jsonData = json['data'];
    Map<String, dynamic> jsonSchema = jsonData['__schema'];
    List<dynamic> types = jsonSchema["types"];
    return types;
  }

  /// Parse the type @[Kind.OBJECT]
  parseObjectType(List<TypeA> objectTypes) {
    objectTypes.forEach((typeObject) {
      classes.putIfAbsent(typeObject.name, () {
        return Class((b) => classBuilder(b, typeObject));
      });
    });
  }

  classBuilder(ClassBuilder builder, TypeA type) {
    builder.name = '$namespace${type.name}';
    if (type.description != null) {
      String documentation = type.description.replaceAll('\n', '\n/// ');
      builder.docs.add('/// $documentation');
    }
    if (type.fields != null) {
      type.fields.forEach((field) {
        builder.fields.add(Field((f) {
          f.name = field.name;
          f.type = Reference(findFieldType(field.type));
          if (field.description != null)
            f.docs.add('/// ${field.description.replaceAll('\n', '\n/// ')}');
        }));
      });
      builder.methods.addAll(createMethods(builder));
    }
    if (type.interfaces != null)
      type.interfaces.forEach((interface) {
        builder.implements.add(Reference('$namespace${interface.name}'));
      });
    unionTypes.forEach((unionType) {
      if (unionType.possibleTypes
          .any((possibleType) => possibleType.name == type.name)) {
        builder.implements.add(Reference('$namespace${unionType.name}'));
      }
    });
  }

  createMethods(ClassBuilder classBuilder) {
    MethodBuilder constructorBuilder = new MethodBuilder();
    constructorBuilder..name = classBuilder.name;

    MethodBuilder fromJsonBuilder = new MethodBuilder();
    String fromJsonBody = "return ${classBuilder.name} (";
    fromJsonBuilder.returns = Reference("factory");
    fromJsonBuilder.name = '${classBuilder.name}.fromJson';
    fromJsonBuilder.requiredParameters.add(Parameter((p) {
      p.name = "json";
      p.type = Reference("Map<String,dynamic>");
    }));

    classBuilder.fields.build().forEach((f) {
      constructorBuilder.optionalParameters.add(Parameter((p) {
        p.name = "this.${f.name}";
        p.named = true;
      }));
      fromJsonBody += createFromJSONString(f);
    });
    fromJsonBody += ");";

    fromJsonBuilder.body = Code(fromJsonBody);
    return [constructorBuilder.build(), fromJsonBuilder.build()];
  }

  String createFromJSONString(Field f) {
    switch (f.type.symbol) {
      case "String":
      case "int":
      case "bool":
      case "double":
        return "${f.name} : json['${f.name}'] as ${f.type.symbol},";
      default:
        if (enumTypes.any((type) =>
        '$namespace${type.name}' == f.type.symbol)) {
          return "${f.name} : ${f.type.symbol}Values[json['${f.name}']],";
        }
    }

    if (f.type.symbol.contains('List<')) {
      String split = f.type.symbol.split('<')[1].split('>')[0];
      switch (split) {
        case "String":
        case "int":
        case "bool":
        case "double":
          return "${f.name} : (json['${f
              .name}'] as List)?.map((e) => e as $split)?.toList(),";
        default:
          if (enumTypes.any((type) => '$namespace${type.name}' == split)) {
            return "${f.name} : (json['${f
                .name}'] as List)?.map((e) => ${split}Values[e])?.toList(),";
          }
      }

      return "${f.name} : (json['${f
          .name}'] as List)?.map((e) => e == null? null : ${f.type.symbol.split(
          '<')[1].split(
          '>')[0]}.fromJson(e as Map<String,dynamic>))?.toList(),";
    } else {
      return "${f.name} : json['${f.name}'] == null ? null : ${f.type
          .symbol}.fromJson(json['${f.name}'] as Map<String,dynamic>),";
    }
  }

  /// Loop to find the field types
  findFieldType(InterfaceA type, {bool isList}) {
    if (type.name != null) {
      return mapFieldType(type.name);
    }
    if (type.kind != null) {
      if (type.kind == Kind.LIST) {
        return "List<${findFieldType(type.ofType)}>";
      }
    }
    return findFieldType(type.ofType);
  }

  /// Map the FieldTypes to Dart objects
  mapFieldType(String name) {
    switch (name) {
      case 'Boolean':
        return 'bool';
      case 'Int':
        return 'int';
      case 'Float':
        return 'double';
      case 'String':
        return 'String';
      default:
        if (enumTypes.any((type) => type.name == name) ||
            interfaceTypes.any((type) => type.name == name) ||
            unionTypes.any((type) => type.name == name) ||
            objectTypes.any((type) => type.name == name))
          return '$namespace$name';
        else
          return 'String';
    }
  }

  /// Parse the type @[Kind.ENUM]
  parseEnumType(List<TypeA> enumTypes) {
    enumTypes.forEach((enumType) {
      enumString.add(
          " enum $namespace${enumType.name} {${_getEnumArray(enumType)}}");
      enumString.add(
          " final $namespace${enumType.name}Values = {${_getEnumMapValues(
              enumType)}};");
    });
  }

  /// Convert Enum items to String
  _getEnumArray(TypeA type) {
    String result = '';
    type.enumValues.forEach((e) {
      result += '${e.name} ,';
    });
    result.replaceFirst(RegExp(','), '', result.lastIndexOf(RegExp(',')));
    return result;
  }

  _getEnumMapValues(TypeA type) {
    String result = '';
    type.enumValues.forEach((e) {
      result += '"${e.name}" : $namespace${type.name}.${e.name},';
    });
    return result;
  }

  parseInterface(List<TypeA> interfaceTypes) {
    interfaceTypes.forEach((interfaceType) {
      classes.putIfAbsent(interfaceType.name, () {
        return Class((b) {
          b.name = '$namespace${interfaceType.name}';
          b.abstract = true;
          interfaceType.fields.forEach((field) {
            b.fields.add(Field((f) {
              f.name = field.name;
              f.type = Reference(findFieldType(field.type));
            }));
          });
          b.methods.add(Method((m) {
            String fromJsonBody = "";
            m.returns = Reference("factory");
            m.name = '$namespace${interfaceType.name}.fromJson';
            m.requiredParameters.add(Parameter((p) {
              p.name = "json";
              p.type = Reference("Map<String,dynamic>");
            }));
            fromJsonBody += "switch(json['__typename']){";
            interfaceType.possibleTypes.forEach((type) {
              fromJsonBody +=
              'case "${type.name}" : return $namespace${type
                  .name}.fromJson(json);';
            });
            fromJsonBody += "} return null;";
            m.body = Code(fromJsonBody);
          }));
        });
      });
    });
  }

  parseUnion(List<TypeA> unionTypes) {
    unionTypes.forEach((unionType) {
      classes.putIfAbsent(unionType.name, () {
        return Class((b) {
          b.name = '$namespace${unionType.name}';
          b.abstract = true;
          b.methods.add(Method((m) {
            String fromJsonBody = "";
            m.returns = Reference("factory");
            m.name = '$namespace${unionType.name}.fromJson';
            m.requiredParameters.add(Parameter((p) {
              p.name = "json";
              p.type = Reference("Map<String,dynamic>");
            }));
            fromJsonBody += "switch(json['__typename']){";
            unionType.possibleTypes.forEach((type) {
              fromJsonBody +=
              'case "${type.name}" : return $namespace${type
                  .name}.fromJson(json);';
            });
            fromJsonBody += "} return null;";
            m.body = Code(fromJsonBody);
          }));
        });
      });
    });
  }

  parseInputObjectTypes(List<TypeA> inputObjectTypes) {
    inputObjectTypes.forEach((typeObject) {
      classes.putIfAbsent(typeObject.name, () {
        return Class((b) => inputObjectClassBuilder(b, typeObject));
      });
    });
  }

  inputObjectClassBuilder(ClassBuilder builder, TypeA type) {
    builder.name = '$namespace${type.name}';
    if (type.description != null) {
      String documentation = type.description.replaceAll('\n', '\n/// ');
      builder.docs.add('/// $documentation');
    }
    if (type.inputFields != null) {
      type.inputFields.forEach((field) {
        builder.fields.add(Field((f) {
          f.name = field.name;
          f.type = Reference(findFieldType(field.type));
          if (field.description != null)
            f.docs.add('/// ${field.description.replaceAll('\n', '\n/// ')}');
        }));
      });
      builder.methods.addAll(createMethods(builder));
    }
    if (type.interfaces != null)
      type.interfaces.forEach((interface) {
        builder.implements.add(Reference('$namespace${interface.name}'));
      });
    unionTypes.forEach((unionType) {
      if (unionType.possibleTypes
          .any((possibleType) => possibleType.name == type.name)) {
        builder.implements.add(Reference('$namespace${unionType.name}'));
      }
    });
  }
}

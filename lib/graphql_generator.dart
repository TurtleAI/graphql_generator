library graphql_generator;

import 'dart:convert' as JSON;

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:graphql_generator/annotation.dart';
import 'package:graphql_generator/model.dart';
import 'package:http/http.dart' as http;
import 'package:source_gen/source_gen.dart';

class GraphQLGenerator extends GeneratorForAnnotation<GQLGenerator> {
  var url;
  var headerToken;
  var namespace;

  Map<String, Class> classes = {};
  List<String> enumString = [];
  List<TypeA> unionList = [];
  List<InterfaceA> cl = [];

  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    url = annotation.read('url').stringValue;
    headerToken = annotation.read('headerToken').stringValue;
    namespace = annotation.read('namespace').stringValue;

    var response = await getSchema();
    parseAllTypes(getTypesFromResponse(response));

    ///Concat and return the String value back.
    var result = '';
    var emitter = DartEmitter();
    unionList.forEach((u) {
      u.possibleTypes.forEach((i) {
        classes[i.name] = classes[i.name].rebuild((b) {
          print('${u.name} = ${classes[i.name].name}');
          b.implements.add(Reference(u.name));
        });
      });
    });
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
  getTypesFromResponse(http.Response response) {
    Map<String, dynamic> json = JSON.jsonDecode(response.body);
    Map<String, dynamic> jsonData = json['data'];
    Map<String, dynamic> jsonSchema = jsonData['__schema'];
    List<dynamic> types = jsonSchema["types"];
    return types;
  }

  /// Create the root class with the namespace name given in the annotation.
  parseAllTypes(List<dynamic> types) {
    Class rootClass = Class((root) {
      root..name = namespace;
      types.forEach((t) {
        TypeA type = TypeA.fromJson(t);
        setFields(type, root);
      });
    });
    classes.putIfAbsent(namespace, () {
      return rootClass;
    });
  }

  /// Set the fields to the class object
  setFields(TypeA type, ClassBuilder rootClass) {
    if (type.kind == Kind.OBJECT) {
      parseObjectType(type);
    } else if (type.kind == Kind.ENUM) {
      parseEnumType(type);
    } else
    if (type.kind == Kind.LIST) {} else if (type.kind == Kind.INTERFACE) {
      parseInterface(type);
    } else if (type.kind == Kind.UNION) {
      parseUnion(type);
    }
  }

  /// Parse the type @[Kind.OBJECT]
  parseObjectType(TypeA type) {
    classes.putIfAbsent(type.name, () {
//      classBuilder.methods.add(Method((m) => createMethods(classBuilder)));
      return Class((b) => fieldBuilder(b, type));
    });
  }

  fieldBuilder(ClassBuilder builder, TypeA type) {
    builder.name = type.name;
    if (type.fields != null) {
      type.fields.forEach((field) {
        builder.fields.add(Field((f) {
          f.name = field.name;
          f.type = Reference(findFieldType(field.type));
        }));
      });
      builder.methods.addAll(createMethods(builder));
    }
    if (type.interfaces != null)
      type.interfaces.forEach((interface) {
        builder.implements.add(Reference(interface.name));
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
      case "DateTime":
        return "${f.name} : json['${f
            .name}'] == null ? null : DateTime.parse( json['${f
            .name}'] as String),";
    }

    if (f.type.symbol.contains('List')) {
      String split = f.type.symbol.split('<')[1].split('>')[0];
      switch (split) {
        case "String":
        case "int":
        case "bool":
        case "double":
          return "${f.name} : (json['${f
              .name}'] as List)?.map((e) => e as $split)?.toList(),";
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
      case 'Date':
        return 'DateTime';
      case 'Boolean':
        return 'bool';
      case 'Int':
        return 'int';
      case 'Float':
        return 'double';
      case 'ID':
        return 'int';
      default:
        return name;
    }
  }

  /// Parse the type @[Kind.ENUM]
  parseEnumType(TypeA type) {
    enumString.add(" enum ${type.name} {${_getEnumArray(type)}}");
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

  parseInterface(TypeA type) {
    classes.putIfAbsent(type.name, () {
      return Class((b) {
        b.name = type.name;
        b.abstract = true;
        type.fields.forEach((field) {
          b.fields.add(Field((f) {
            f.name = field.name;
            f.type = Reference(findFieldType(field.type));
          }));
        });
        b.methods.add(Method((m) {
          String fromJsonBody = "";
          m.returns = Reference("factory");
          m.name = '${type.name}.fromJson';
          m.requiredParameters.add(Parameter((p) {
            p.name = "json";
            p.type = Reference("Map<String,dynamic>");
          }));
          fromJsonBody += "switch(json['__typename']){";
          type.possibleTypes.forEach((type) {
            fromJsonBody +=
            'case "${type.name}" : return ${type.name}.fromJson(json);';
          });
          fromJsonBody += "} return null;";
          m.body = Code(fromJsonBody);
        }));
      });
    });
  }

  parseUnion(TypeA type) {
    unionList.add(type);
    classes.putIfAbsent(type.name, () {
      return Class((b) {
        b.name = type.name;
        b.abstract = true;
        b.methods.add(Method((m) {
          String fromJsonBody = "";
          m.returns = Reference("factory");
          m.name = '${type.name}.fromJson';
          m.requiredParameters.add(Parameter((p) {
            p.name = "json";
            p.type = Reference("Map<String,dynamic>");
          }));
          fromJsonBody += "switch(json['__typename']){";
          type.possibleTypes.forEach((type) {
            fromJsonBody +=
            'case "${type.name}" : return ${type.name}.fromJson(json);';
          });
          fromJsonBody += "} return null;";
          m.body = Code(fromJsonBody);
        }));
      });
    });
  }
}

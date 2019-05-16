library graphql_generator;

import 'dart:convert' as JSON;

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
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
  String namespace;

  String mutationType = "";

  Map<String, Class> classes = {};
  Map<String, DartType> types = {};
  List<String> enumString = [];

  List<TypeA> enumTypes = [];
  List<TypeA> interfaceTypes = [];
  List<TypeA> unionTypes = [];
  List<TypeA> objectTypes = [];
  List<TypeA> inputObjectTypes = [];

  TypeA mutation = new TypeA();

  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    url = annotation.read('url').stringValue;
    headerToken = annotation.read('headerToken').stringValue;
    namespace = annotation.read('namespace').stringValue;
    if (!annotation
        .read('types')
        .isNull) {
      types = _convertDartObjectMap(annotation
          .read('types')
          .mapValue);
    }
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
    inputObjectTypes = typesFromResponse
        .where((type) => type.kind == Kind.INPUT_OBJECT)
        .toList();
    parseInputObjectTypes(inputObjectTypes);
    objectTypes =
        typesFromResponse.where((type) => type.kind == Kind.OBJECT).toList();
    parseObjectType(objectTypes);
    mutation = typesFromResponse
        .where((type) => type.name == mutationType)
        .toList()
        .first;
    classBuilderMutation();

    ///Concat and return the String value back.
    var result = '';
    var emitter = DartEmitter(Allocator());
    Library library = new Library((lib) => lib.body.addAll(classes.values));
    result += DartFormatter().format('${library.accept(emitter)}');
    enumString.forEach((enumString) {
      result += DartFormatter().format(enumString);
    });
    return result;
  }

  _convertDartObjectMap(Map<DartObject, DartObject> dartMap) {
    Map<String, DartType> result = {};
    dartMap.keys.forEach((keys) {
      result.putIfAbsent(
          keys.toStringValue(), () => dartMap[keys].toTypeValue());
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
    mutationType = jsonSchema['mutationType']['name'] ??
        jsonSchema['mutationType']['name'];
    List<dynamic> types = jsonSchema["types"];
    return types;
  }

  /// Parse the type @[Kind.OBJECT]
  parseObjectType(List<TypeA> objectTypes) {
    objectTypes.forEach((typeObject) {
//      if (typeObject.name.compareTo(mutationType) == 0)
//        classes.putIfAbsent(namespace + typeObject.name, () {
//          return Class((b) => classBuilderMutation(b, typeObject));
//        });
//      else
      classes.putIfAbsent(namespace + typeObject.name, () {
        return Class((b) => classBuilder(b, typeObject));
      });
    });
  }

  classBuilderMutation() {
    if (mutation.fields != null) {
      ClassBuilder mutationClassBuilder = new ClassBuilder();
      mutationClassBuilder.name = 'TMutation';
      mutationClassBuilder.abstract = true;
      mutationClassBuilder.methods.add(new Method((m) {
        m.returns = Reference('Future<Map<String, dynamic>>');
        m.name = "query";
        m.optionalParameters.add(new Parameter((p) {
          p.name = "document";
          p.type = Reference("String");
          p.named = true;
        }));
        m.optionalParameters.add(new Parameter((p) {
          p.name = "variables";
          p.type = Reference("Map<String, dynamic>");
          p.named = true;
        }));
      }));
      mutationClassBuilder
        ..methods.add(new Method((m) {
          m.returns = Reference('String');
          m.name = "_extractFragmentName";
          m.requiredParameters.add(new Parameter((p) {
            p.name = "fragment";
            p.type = Reference("String");
          }));
          m.requiredParameters.add(new Parameter((p) {
            p.name = "typeName";
            p.type = Reference("String");
          }));
          m.body = new Code(''
              'if (fragment != null) { '
              'RegExp exp = new RegExp("\\b[A-Za-z]*\$typeName[A-Za-z]*\\b", caseSensitive: true);'
              'Iterable<Match> matches = exp.allMatches(fragment);'
              'if (matches.length > 0)return matches.elementAt(0).group(0); else return "";} '
              'else {return "";}');
        }));
      mutation.fields.forEach((field) {
        mutationClassBuilder.methods.add(Method((m) {
          m.modifier = MethodModifier.async;
          m.name = field.name;
          m.returns = Reference('Future<${mapFieldType(field.type.name)}>');
          field.args.forEach((f) {
            m.requiredParameters.add(Parameter((p) {
              p.name = f.name;
              p.type = Reference(findFieldType(f.type));
            }));
            m.optionalParameters.add(Parameter((p) {
              p.name = "fragment";
              p.type = Reference("String");
              p.named = true;
            }));
            m.body = Code(
                ' var fragmentName = _extractFragmentName(fragment, "${mapFieldType(
                    field.type.name)}");'
                    ' ${_generateDefaultFragment(field.type.name)}'
                    ' var result =  await query(document:"""\n\tmutation\n\t\t${field
                    .name}(\\\$${f.name}: ${findFieldType(f.type).contains(
                    namespace) ? findFieldType(f.type).substring(
                    namespace.length) : findFieldType(f.type)}! )'
                    ' {\n\t\t\t${field.name}(${f.name}:\\\$${f
                    .name})${_generateMutationFields(
                    namespace + field.type.name,
                    field.name)}\n\t""",variables:{\n\t"${f.name}":${f
                    .name}\n\t});'
                    '${_generateMutationReturn(field.type.name, field.name)}');
          });
        }));
      });
      classes.putIfAbsent('TMutation', () => mutationClassBuilder.build());
    }
  }

  _generateDefaultFragment(String name) {
    String result = '';
    bool hasValue = false;
    if (classes.containsKey(namespace + name)) {
      classes[namespace + name].fields.forEach((fields) {
        switch (fields.type.symbol) {
          case "String":
          case "int":
          case "double":
          case "dynamic":
          case "Map<String,dynamic>":
            hasValue = true;
            result += "${fields.name} ";
            break;
        }
      });
    }
    if (hasValue) {
      return "var defaultFragment = 'fragment graphQL$name on $name { $result }';";
    } else {
      return "";
    }
  }

  _generateMutationReturn(String name, String nname) {
    var mapFieldTypes = mapFieldType(name);
    switch (mapFieldTypes) {
      case "String":
      case "int":
      case "bool":
      case "double":
      case "Map<String,dynamic>":
        return "return result['data']['$nname'] as $mapFieldTypes;";
      case "dynamic":
        return "return result['data']['$nname'];";
    }

    if (mapFieldTypes.contains('List<')) {
      String split = mapFieldTypes.split('<')[1].split('>')[0];
      switch (split) {
        case "String":
        case "int":
        case "bool":
        case "double":
        case "dynamic":
          return "return (result['data']['$nname'] as List)?.map((e) => e as $split)?.toList();";
      }

      return "return (result['data']['$nname'] as List)?.map((e) => e == null? null : ${mapFieldTypes
          .split('<')[1].split(
          '>')[0]}.fromJson(e as Map<String,dynamic>))?.toList();";
    } else {
      return "return $mapFieldTypes.fromJson(result['data']['$nname'] as Map<String,dynamic>);";
    }
  }

  _generateMutationFields(String name, String fragName) {
    String result = "{";
    bool isFound = false;
    if (classes.containsKey(name)) {
      isFound = classes[name].fields.any((field) {
        switch (field.type.symbol) {
          case "String":
          case "int":
          case "double":
          case "dynamic":
          case "Map<String,dynamic>":
            return true;
          default:
            return false;
        }
      });
    }
    if (isFound) {
      return "{\n\t\t\t\t...\${fragment == null? 'graphQL$name' : fragmentName}\n\t\t\t}\n\t\t}"
          "\n\t\${fragment == null? defaultFragment : fragment}";
    } else {
      return "\n\t\t}";
    }
//    result += "\n\t\t\t}";
//    if (result.compareTo("{\n\t\t\t}") == 0) return "\n\t}";
//    return result + "\n\t}";
  }

  classBuilder(ClassBuilder builder, TypeA type) {
    builder.name = '$namespace${type.name}';
    if (type.description != null) {
      String documentation = type.description.replaceAll('\n', '\n/// ');
      builder.docs.add('/// $documentation');
    }

    ///Adding fields to the class
    if (type.fields != null) {
      type.fields.forEach((field) {
        builder.fields.add(Field((f) {
          if (field.isDeprecated)
            f.annotations.add(Reference(
                "Deprecated('${field.deprecationReason.replaceAll(
                    '\n', '')}')"));
          f.name = field.name;
          f.type = Reference(findFieldType(field.type));
          if (field.description != null)
            f.docs.add('/// ${field.description.replaceAll('\n', '\n/// ')}');
        }));
      });
      builder.methods.addAll(createMethods(builder));
    }

    ///Build constructor
    builder.constructors.add(Constructor((c) {
      builder.fields.build().forEach((f) {
        c.optionalParameters.add(Parameter((p) {
          p.name = "this.${f.name}";
          p.named = true;
        }));
      });
    }));
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
    MethodBuilder fromJsonBuilder = new MethodBuilder();
    String fromJsonBody = "return ${classBuilder.name} (";
    fromJsonBuilder.returns = Reference("factory");
    fromJsonBuilder.name = '${classBuilder.name}.fromJson';
    fromJsonBuilder.requiredParameters.add(Parameter((p) {
      p.name = "json";
      p.type = Reference("Map<String,dynamic>");
    }));
    classBuilder.fields.build().forEach((f) {
      fromJsonBody += createFromJSONString(f);
    });
    fromJsonBody += ");";
    fromJsonBuilder.body = Code(fromJsonBody);
    return [fromJsonBuilder.build()];
  }

  String createFromJSONString(Field f) {
    switch (f.type.symbol) {
      case "String":
      case "int":
      case "bool":
      case "double":
      case "Map<String,dynamic>":
        return "${f.name} : json['${f.name}'] as ${f.type.symbol},";
      case "dynamic":
        return "${f.name} : json['${f.name}'],";
      default:
        if (enumTypes
            .any((type) => '$namespace${type.name}' == f.type.symbol)) {
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
        case "dynamic":
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
  String findFieldType(InterfaceA type, {bool isList}) {
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
    if (types.containsKey(name)) {
      if (types[name].name.compareTo('Map') == 0) {
        return "Map<String,dynamic>";
      }
      if (types[name].name.compareTo('List') == 0) {
        return "List<dynamic>";
      }
      return types[name].toString();
    }

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
            objectTypes.any((type) => type.name == name) ||
            inputObjectTypes.any((type) => type.name == name))
          return '$namespace$name';
        else
          return 'String';
    }
  }

  /// Parse the type @[Kind.ENUM]
  parseEnumType(List<TypeA> enumTypes) {
    enumTypes.forEach((enumType) {
      enumString
          .add(" enum $namespace${enumType.name} {${_getEnumArray(enumType)}}");
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
    ConstructorBuilder constructorBuilder = new ConstructorBuilder();
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
          constructorBuilder.optionalParameters.add(new Parameter((p) {
            p.name = "${f.name}";
            p.named = true;
            p.toThis = true;
            if (field.type.kind == Kind.NON_NULL)
              p.annotations.add(refer('required', 'package:meta/meta.dart'));
          }));
        }));
      });
      builder.methods.addAll(createMethods(builder));
    }

    builder.constructors.add(constructorBuilder.build());

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

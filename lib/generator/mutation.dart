import 'package:code_builder/code_builder.dart';
import 'package:graphql_generator/generator/helper.dart';
import 'package:graphql_generator/generator/model.dart';
import 'package:analyzer/dart/element/type.dart';

class MutationClassGenerator {
  MutationClassGenerator() {}

  generate(
      Map<String, Class> classes,
      Map<String, String> fragments,
      ObjectType mutationType,
      Map<String, DartType> types,
      List<ObjectType> enumTypes,
      List<ObjectType> interfaceTypes,
      List<ObjectType> unionTypes,
      List<ObjectType> objectTypes,
      List<ObjectType> inputObjectTypes,
      {String namespace = ""}) {
    Map<String, Class> classesMap = {};
    ClassBuilder mutationClassBuilder = new ClassBuilder();
    mutationClassBuilder.name = '${namespace}Mutation';
    mutationClassBuilder.abstract = true;
    if (mutationType != null && mutationType.fields != null) {
      mutationClassBuilder.methods.add(_generateQueryMethod());
      mutationClassBuilder.methods.add(_generateFragmentNameExtractMethod());
      mutationType.fields.forEach((field) {
        mutationClassBuilder.methods.add(_generateMutationMethod(
            field,
            classes,
            fragments,
            types,
            enumTypes,
            interfaceTypes,
            unionTypes,
            objectTypes,
            inputObjectTypes,
            namespace));
      });
      classesMap.putIfAbsent(
          '${namespace}Mutation', () => mutationClassBuilder.build());
    }
    return classesMap;
  }

  _generateClass(ObjectType mutationType, String namespace) {}

  _generateQueryMethod() {
    MethodBuilder queryMethodBuilder = MethodBuilder();
    queryMethodBuilder.name = "query";
    queryMethodBuilder.returns = Reference('Future<Map<String, dynamic>>');
    queryMethodBuilder.optionalParameters.addAll([
      Parameter((p) {
        p.name = "document";
        p.type = Reference("String");
        p.named = true;
      }),
      Parameter((p) {
        p.name = "variables";
        p.type = Reference("Map<String, dynamic>");
        p.named = true;
      })
    ]);
    return queryMethodBuilder.build();
  }

  _generateFragmentNameExtractMethod() {
    MethodBuilder nameExtractMethodBuilder = MethodBuilder();
    nameExtractMethodBuilder.returns = Reference('String');
    nameExtractMethodBuilder.name = "_extractFragmentName";
    nameExtractMethodBuilder.requiredParameters.add(new Parameter((p) {
      p.name = "fragment";
      p.type = Reference("String");
    }));
    nameExtractMethodBuilder.body = new Code(
        'RegExp exp = new RegExp(r"\\s*fragment\\s+(\\w+)\\s+on\\s+(\\w+)", caseSensitive: true);'
        'return exp.firstMatch(fragment)?.group(1);');
    return nameExtractMethodBuilder.build();
  }

  _generateMutationMethod(
      Fields field,
      Map<String, Class> classes,
      Map<String, String> fragments,
      Map<String, DartType> types,
      List<ObjectType> enumTypes,
      List<ObjectType> interfaceTypes,
      List<ObjectType> unionTypes,
      List<ObjectType> objectTypes,
      List<ObjectType> inputObjectTypes,
      String namespace) {
    String methodReturn = Helper.findFieldType(field.type,types, enumTypes, interfaceTypes,
            unionTypes, objectTypes, inputObjectTypes,namespace);
    MethodBuilder mutationMethodBuilder = new MethodBuilder();
    mutationMethodBuilder.modifier = MethodModifier.async;
    mutationMethodBuilder.name = field.name;
    mutationMethodBuilder.returns = Reference('Future<$methodReturn>');
    field.args.forEach((arg) {
      var argType = Helper.findFieldType(arg.type,types, enumTypes, interfaceTypes,
            unionTypes, objectTypes, inputObjectTypes,namespace);
      mutationMethodBuilder.docs.addAll(_generateComments(argType,classes));
      if (_isObject(argType))
        mutationMethodBuilder.optionalParameters
            .addAll(_generateOptionalParameters(argType,classes));
      else
        mutationMethodBuilder.requiredParameters.add(Parameter((p) {
          p.name = arg.name;
          p.type = Reference(argType);
        }));
      if (_isObject(methodReturn))
        mutationMethodBuilder.optionalParameters.add(Parameter((p) {
          p.name = "fragment";
          p.type = Reference("String");
          p.named = true;
          p.defaultTo = Code(_generateDefaultFragment(field.type.name,classes,fragments,namespace));
        }));

      var mutationName = field.name;
      var inputName = arg.name;
      var inputType = argType.contains(namespace)
          ? argType.substring(namespace.length)
          : argType;
      var mutationFields = _generateMutationFields(namespace + field.type.name,classes);
      var mutationFragments =
          _generateMutationFragments(namespace + field.type.name,classes);
      var graphql = """
              mutation $mutationName(\\\$$inputName:$inputType!) {
                $mutationName($inputName:\\\$$inputName)$mutationFields
              }$mutationFragments
              """;

      mutationMethodBuilder.body = Code(
          '${_generateObjectFromParameters(argType,classes)}'
          ' ${_isObject(methodReturn) ? 'var fragmentName = _extractFragmentName(fragment);' : ''}'
          ' var result =  await query(document:"""\n$graphql\n""",variables:{\n  "${arg.name}":${arg.name}${_isObject(argType) ? ".toJson()" : ""}\n  });'
          '${_generateMutationReturn(methodReturn, field.name)}');
    });
    return mutationMethodBuilder.build();
  }

  _generateObjectFromParameters(String type,Map<String, Class> classes) {
    String result = '';
    if (_isObject(type)) {
      result += '$type input = new  $type(';
      if (classes.containsKey(type)) {
        classes[type].fields.forEach((f) {
          result += '${f.name} : ${f.name},';
        });
      }
      result += ');';
    }
    return result;
  }

  _generateOptionalParameters(String type,Map<String, Class> classes) {
    List<Parameter> parameters = [];
    if (_isObject(type)) {
      if (classes.containsKey(type)) {
        classes[type].fields.forEach((field) {
          parameters.add(Parameter((parameter) {
            parameter.type = field.type;
            parameter.name = field.name;
            parameter.named = true;
          }));
        });
      }
    }
    return parameters;
  }

  _generateComments(String type,Map<String, Class> classes) {
    List<String> result = [];
    if (_isObject(type)) {
      if (classes.containsKey(type)) {
        classes[type].fields.forEach((field) {
          if (field.docs != null && field.docs.length > 0)
            result.add(
                '${field.docs.first.replaceFirst('///', '/// [${field.name}] ')}');
        });
      }
    }
    return result;
  }

  _isObject(String name) {
    switch (name) {
      case "String":
      case "int":
      case "double":
      case "dynamic":
      case "Map<String,dynamic>":
        return false;
      default:
        return true;
    }
  }

  _generateDefaultFragment(String name,Map<String, Class> classes,Map<String, String> fragments,String namespace) {
    String result = '';
    bool hasValue = false;
    if (fragments.containsKey(name)) {
      return '"""${fragments[name]}"""';
    } else if (classes.containsKey(namespace + name)) {
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
      return "'fragment ${name}Fragment on $name { $result }'";
    } else {
      return "''";
    }
  }

  _generateMutationReturn(String methodReturn, String fieldName) {
    switch (methodReturn) {
      case "String":
      case "int":
      case "bool":
      case "double":
      case "Map<String,dynamic>":
        return "return result['data']['$fieldName'] as $methodReturn;";
      case "dynamic":
        return "return result['data']['$fieldName'];";
    }

    if (methodReturn.contains('List<')) {
      String split = methodReturn.split('<')[1].split('>')[0];
      switch (split) {
        case "String":
        case "int":
        case "bool":
        case "double":
        case "dynamic":
          return "return (result['data']['$fieldName'] as List)?.map((e) => e as $split)?.toList();";
      }

      return "return (result['data']['$fieldName'] as List)?.map((e) => e == null? null : ${methodReturn.split('<')[1].split('>')[0]}.fromJson(e as Map<String,dynamic>))?.toList();";
    } else {
      return "return $methodReturn.fromJson(result['data']['$fieldName'] as Map<String,dynamic>);";
    }
  }

  bool _mutationHasFields(String name,Map<String, Class> classes) {
    if (classes.containsKey(name)) {
      return classes[name].fields.any((field) {
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
    return false;
  }

  _generateMutationFields(String name,Map<String, Class> classes) {
    if (_mutationHasFields(name,classes)) {
      return " { ...\$fragmentName }";
    }
    return "";
  }

  _generateMutationFragments(String name,Map<String, Class> classes) {
    if (_mutationHasFields(name,classes)) {
      return "\n  \$fragment";
    }
    return "";
  }
}

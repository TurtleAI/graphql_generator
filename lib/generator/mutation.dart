import 'package:code_builder/code_builder.dart';
import 'package:graphql_generator/generator/helper.dart';

import 'package:graphql_generator/generator/code_generator.dart';
import 'package:graphql_generator/generator/model.dart';

class MutationClassGenerator {
  static final MutationClassGenerator _singleton =
      new MutationClassGenerator._internal();
  TypeA mutationType;

  factory MutationClassGenerator() {
    return _singleton;
  }

  MutationClassGenerator._internal();

  mutationClassGenerator() {
    mutationType = GraphQLCodeGenerators().mutation;
    return _generateClass();
  }

  _generateClass() {
    Map<String, Class> classes = {};
    ClassBuilder mutationClassBuilder = new ClassBuilder();
    mutationClassBuilder.name = '${GraphQLCodeGenerators().namespace}Mutation';
    mutationClassBuilder.abstract = true;
    if (mutationType != null && mutationType.fields != null) {
      mutationClassBuilder.methods.add(_generateQueryMethod());
      mutationClassBuilder.methods.add(_generateFragmentNameExtractMethod());
      mutationType.fields.forEach((field) {
        mutationClassBuilder.methods.add(_generateMutationMethod(field));
      });
      classes.putIfAbsent('${GraphQLCodeGenerators().namespace}Mutation',
          () => mutationClassBuilder.build());
    }
    return classes;
  }

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

  _generateMutationMethod(Fields field) {
    String methodReturn = Helper.findFieldType(field.type);
    MethodBuilder mutationMethodBuilder = new MethodBuilder();
    mutationMethodBuilder.modifier = MethodModifier.async;
    mutationMethodBuilder.name = field.name;
    mutationMethodBuilder.returns = Reference('Future<$methodReturn>');
    field.args.forEach((arg) {
      var argType = Helper.findFieldType(arg.type);
      mutationMethodBuilder.docs.addAll(_generateComments(argType));
      if (_isObject(argType))
        mutationMethodBuilder.optionalParameters
            .addAll(_generateOptionalParameters(argType));
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
          p.defaultTo = Code(_generateDefaultFragment(field.type.name));
        }));

      var mutationName = field.name;
      var inputName = arg.name;
      var inputType = argType.contains(GraphQLCodeGenerators().namespace)
          ? argType.substring(GraphQLCodeGenerators().namespace.length)
          : argType;
      var mutationFields = _generateMutationFields(
          GraphQLCodeGenerators().namespace + field.type.name);
      var mutationFragments = _generateMutationFragments(
          GraphQLCodeGenerators().namespace + field.type.name);
      var graphql = """
              mutation $mutationName(\\\$$inputName:$inputType!) {
                $mutationName($inputName:\\\$$inputName)$mutationFields
              }$mutationFragments
              """;

      mutationMethodBuilder.body = Code(
          '${_generateObjectFromParameters(argType)}'
          ' ${_isObject(methodReturn) ? 'var fragmentName = _extractFragmentName(fragment);' : ''}'
          ' var result =  await query(document:"""\n$graphql\n""",variables:{\n  "${arg.name}":${arg.name}${_isObject(argType) ? ".toJson()" : ""}\n  });'
          '${_generateMutationReturn(methodReturn, field.name)}');
    });
    return mutationMethodBuilder.build();
  }

  _generateObjectFromParameters(String type) {
    String result = '';
    if (_isObject(type)) {
      print("YESSSSSSSSSSSSSSSS $type");
      result += '$type input = new  $type(';
      if (GraphQLCodeGenerators().classes.containsKey(type)) {
        print("AVAILABLE");
        GraphQLCodeGenerators().classes[type].fields.forEach((f) {
          result += '${f.name} : ${f.name},';
        });
      }
      result += ');';
    }
    return result;
  }

  _generateOptionalParameters(String type) {
    List<Parameter> parameters = [];
    if (_isObject(type)) {
      if (GraphQLCodeGenerators().classes.containsKey(type)) {
        GraphQLCodeGenerators().classes[type].fields.forEach((field) {
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

  _generateComments(String type) {
    List<String> result = [];
    if (_isObject(type)) {
      if (GraphQLCodeGenerators().classes.containsKey(type)) {
        GraphQLCodeGenerators().classes[type].fields.forEach((field) {
          if (field.docs != null && field.docs.length>0)
            result.add('${field.docs.first.replaceFirst('///', '/// [${field.name}] ')}');
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

  _generateDefaultFragment(String name) {
    String result = '';
    bool hasValue = false;
    if (GraphQLCodeGenerators().fragments.containsKey(name)) {
      return '"""${GraphQLCodeGenerators().fragments[name]}"""';
    } else if (GraphQLCodeGenerators()
        .classes
        .containsKey(GraphQLCodeGenerators().namespace + name)) {
      GraphQLCodeGenerators()
          .classes[GraphQLCodeGenerators().namespace + name]
          .fields
          .forEach((fields) {
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

  bool _mutationHasFields(String name) {
    if (GraphQLCodeGenerators().classes.containsKey(name)) {
      return GraphQLCodeGenerators().classes[name].fields.any((field) {
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

  _generateMutationFields(String name) {
    if (_mutationHasFields(name)) {
      return " { ...\$fragmentName }";
    }
    return "";
  }

  _generateMutationFragments(String name) {
    if (_mutationHasFields(name)) {
      return "\n  \$fragment";
    }
    return "";
  }
}

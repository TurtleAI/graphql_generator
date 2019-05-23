import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';

import 'generator.dart';
import 'model.dart';

class InputObjectGenerator {
  static final InputObjectGenerator _singleton =
      new InputObjectGenerator._internal();

  factory InputObjectGenerator() {
    return _singleton;
  }

  InputObjectGenerator._internal();

  inputObjectGenerator(List<TypeA> inputObjectTypes) {
    print("INPUT START");
    Map<String, Class> classes = {};
    inputObjectTypes.forEach((typeObject) {
      classes.putIfAbsent(typeObject.name, () {
        return _generateClass(typeObject);
      });
    });
    return classes;
  }

  _generateClass(TypeA type) {
    ClassBuilder builder = new ClassBuilder();
    builder.name = '${GraphQLGenerators().namespace}${type.name}';
    builder.fields.addAll(_generateFields(type.inputFields));
    builder.constructors.add(_generateConstruction(type));
    builder.methods.add(_createFromJsonMethod(
        '${GraphQLGenerators().namespace}${type.name}', builder.fields));
    builder.methods.add(_createToJsonMethod(
        '${GraphQLGenerators().namespace}${type.name}', builder.fields));
    return builder.build();
  }

  _generateFields(List<InputField> inputFields) {
    List<Field> fields = [];
    inputFields.forEach((field) {
      fields.add(Field((f) {
        f.name = field.name;
        f.type = Reference(_findFieldType(field.type));
        if (field.description != null)
          f.docs.add('/// ${field.description.replaceAll('\n', '\n/// ')}');
      }));
    });
    return fields;
  }

  _createFromJsonMethod(String name, ListBuilder<Field> fields) {
    MethodBuilder fromJsonBuilder = new MethodBuilder();
    fromJsonBuilder.returns = Reference("factory");
    fromJsonBuilder.name = '$name.fromJson';
    fromJsonBuilder.requiredParameters.add(Parameter((p) {
      p.name = "json";
      p.type = Reference("Map<String,dynamic>");
    }));

    String fromJsonBody = "return $name (";
    fields.build().forEach((f) {
      fromJsonBody += createFromJSONString(f);
    });
    fromJsonBody += ");";
    fromJsonBuilder.body = Code(fromJsonBody);
    return fromJsonBuilder.build();
  }

  _createToJsonMethod(String name, ListBuilder<Field> fields) {
    MethodBuilder toJSONBuilder = new MethodBuilder();

    toJSONBuilder.name = "toJson";
    toJSONBuilder.returns = Reference("Map<String,dynamic>");

    String toJsonBody = "return <String,dynamic> {";
    fields.build().forEach((f) {
      toJsonBody += "'${f.name}' : ${f.name},";
    });
    toJsonBody += "};";
    toJSONBuilder.body = Code(toJsonBody);
    return toJSONBuilder.build();
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
        if (GraphQLGenerators().enumTypes.any((type) =>
            '${GraphQLGenerators().namespace}${type.name}' == f.type.symbol)) {
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
          return "${f.name} : (json['${f.name}'] as List)?.map((e) => e as $split)?.toList(),";
        default:
          if (GraphQLGenerators().enumTypes.any((type) =>
              '${GraphQLGenerators().namespace}${type.name}' == split)) {
            return "${f.name} : (json['${f.name}'] as List)?.map((e) => ${split}Values[e])?.toList(),";
          }
      }

      return "${f.name} : (json['${f.name}'] as List)?.map((e) => e == null? null : ${f.type.symbol.split('<')[1].split('>')[0]}.fromJson(e as Map<String,dynamic>))?.toList(),";
    } else {
      return "${f.name} : json['${f.name}'] == null ? null : ${f.type.symbol}.fromJson(json['${f.name}'] as Map<String,dynamic>),";
    }
  }

  _findFieldType(InterfaceA type, {bool isList}) {
    if (type.name != null) {
      return _mapFieldType(type.name);
    }
    if (type.kind != null) {
      if (type.kind == Kind.LIST) {
        return "List<${_findFieldType(type.ofType)}>";
      }
    }
    return _findFieldType(type.ofType);
  }

  _mapFieldType(String name) {
    Map<String, DartType> types = new GraphQLGenerators().types;
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
        if (GraphQLGenerators().enumTypes.any((type) => type.name == name) ||
            GraphQLGenerators()
                .interfaceTypes
                .any((type) => type.name == name) ||
            GraphQLGenerators().unionTypes.any((type) => type.name == name) ||
            GraphQLGenerators().objectTypes.any((type) => type.name == name) ||
            GraphQLGenerators()
                .inputObjectTypes
                .any((type) => type.name == name))
          return '${GraphQLGenerators().namespace}$name';
        else
          return 'String';
    }
  }

  _generateConstruction(TypeA interfaceType) {
    ConstructorBuilder constructorBuilder = new ConstructorBuilder();
    if (interfaceType.inputFields != null) {
      interfaceType.inputFields.forEach((field) {
        constructorBuilder.optionalParameters.add(new Parameter((p) {
          p.name = "${field.name}";
          p.named = true;
          p.toThis = true;
          if (field.type.kind == Kind.NON_NULL)
            p.annotations.add(refer('required', 'package:meta/meta.dart'));
        }));
      });
    }
    return constructorBuilder.build();
  }
}

import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:graphql_generator/generator/helper.dart';
import 'package:graphql_generator/generator/model.dart';
import 'package:analyzer/dart/element/type.dart';

class InputObjectGenerator {
  InputObjectGenerator() {}

  List<Class> generate(Map<String, DartType> types, List<ObjectType> responseTypes,
      {String namespace = ""}) {
        List<Class> classList = [];
    List<ObjectType> inputObjectTypes =
        responseTypes.where((type) => type.kind == Kind.INPUT_OBJECT).toList();
    inputObjectTypes.forEach((typeObject) {
      classList.add(_generateClass(typeObject, types, responseTypes, namespace));
    });
    return classList;
  }

  _generateClass(ObjectType type, Map<String, DartType> types,
      List<ObjectType> responseTypes, String namespace) {
    List<ObjectType> enumTypes =
        responseTypes.where((type) => type.kind == Kind.ENUM).toList();
    ClassBuilder builder = new ClassBuilder();
    builder.name = '$namespace${type.name}';
    builder.fields.addAll(
        _generateFields(type.inputFields, types, responseTypes, namespace));
    builder.constructors.add(_generateConstruction(type));
    builder.methods.add(_createFromJsonMethod(
        '$namespace${type.name}', builder.fields, enumTypes,
        namespace: namespace));
    builder.methods.add(_createToJsonMethod(
        '$namespace${type.name}', builder.fields, enumTypes, namespace));
    return builder.build();
  }

  _generateFields(List<InputField> inputFields, Map<String, DartType> types,
      List<ObjectType> responseTypes, String namespace) {
    List<Field> fields = [];
    inputFields.forEach((field) {
      fields.add(Field((f) {
        f.name = field.name;
        f.type = Reference(
            Helper.findFieldType(field.type, types, responseTypes, namespace));
        if (field.description != null)
          f.docs.add('/// ${field.description.replaceAll('\n', '\n/// ')}');
      }));
    });
    return fields;
  }

  _createFromJsonMethod(
      String name, ListBuilder<Field> fields, List<ObjectType> enumTypes,
      {String namespace = ""}) {
    MethodBuilder fromJsonBuilder = new MethodBuilder();
    fromJsonBuilder.returns = Reference("factory");
    fromJsonBuilder.name = '$name.fromJson';
    fromJsonBuilder.requiredParameters.add(Parameter((p) {
      p.name = "json";
      p.type = Reference("Map<String,dynamic>");
    }));

    String fromJsonBody = "return $name (";
    fields.build().forEach((f) {
      fromJsonBody += createFromJSONString(f, enumTypes, namespace);
    });
    fromJsonBody += ");";
    fromJsonBuilder.body = Code(fromJsonBody);
    return fromJsonBuilder.build();
  }

  _createToJsonMethod(String name, ListBuilder<Field> fields,
      List<ObjectType> enumTypes, String namespace) {
    MethodBuilder toJSONBuilder = new MethodBuilder();

    toJSONBuilder.name = "toJson";
    toJSONBuilder.returns = Reference("Map<String,dynamic>");

    String toJsonBody = "return <String,dynamic> {";
    fields.build().forEach((f) {
      toJsonBody += toJsonReturnString(f, enumTypes, namespace);
    });
    toJsonBody += "};";
    toJSONBuilder.body = Code(toJsonBody);
    return toJSONBuilder.build();
  }

  String toJsonReturnString(
      Field f, List<ObjectType> enumTypes, String namespace) {
    if (f.type.symbol.contains('List<')) {
      String split = f.type.symbol.split('<')[1].split('>')[0];
      switch (split) {
        case "String":
        case "int":
        case "bool":
        case "double":
        case "dynamic":
          return "'${f.name}' : ${f.name},";
        default:
          if (enumTypes.any((type) => '$namespace${type.name}' == split)) {
            return "'${f.name}' : ${f.name} == null  ? null : new List<dynamic>.from(${f.name}.map((x) => ${split}Enum[x])),";
          }
      }
    } else {
      return "'${f.name}' : ${f.name},";
    }
    return "'${f.name}' : ${f.name},";
  }

  String createFromJSONString(
      Field f, List<ObjectType> enumTypes, String namespace) {
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
          return "${f.name} : (json['${f.name}'] as List)?.map((e) => e as $split)?.toList(),";
        default:
          if (enumTypes.any((type) => '$namespace${type.name}' == split)) {
            return "${f.name} : (json['${f.name}'] as List)?.map((e) => ${split}Values[e])?.toList(),";
          }
      }

      return "${f.name} : (json['${f.name}'] as List)?.map((e) => e == null? null : ${f.type.symbol.split('<')[1].split('>')[0]}.fromJson(e as Map<String,dynamic>))?.toList(),";
    } else {
      return "${f.name} : json['${f.name}'] == null ? null : ${f.type.symbol}.fromJson(json['${f.name}'] as Map<String,dynamic>),";
    }
  }

  _generateConstruction(ObjectType interfaceType) {
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

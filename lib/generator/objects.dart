import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:graphql_generator/generator/helper.dart';
import 'package:graphql_generator/generator/model.dart';
import 'package:analyzer/dart/element/type.dart';

class ObjectClassGenerator {
  ObjectClassGenerator() {}

  Iterable<Class> generate(
      Map<String, DartType> types, List<ObjectType> responseTypes,
      {String namespace = ""}) {
    List<ObjectType> objectTypes =
        responseTypes.where((type) => type.kind == Kind.OBJECT).toList();
    return objectTypes
        .map((type) => _generateClass(type, types, responseTypes, namespace));
  }

  _generateClass(ObjectType type, Map<String, DartType> types,
      List<ObjectType> responseTypes, String namespace) {
    List<ObjectType> enumTypes =
        responseTypes.where((type) => type.kind == Kind.ENUM).toList();
    ClassBuilder builder = new ClassBuilder();
    builder.name = '$namespace${type.name}';

    if (type.description != null && type.description.isNotEmpty) {
      String documentation = type.description.replaceAll('\n', '\n/// ');
      builder.docs.add('/// $documentation');
    }

    builder.fields
        .addAll(_generateFields(type.fields, types, responseTypes, namespace));
    builder.constructors.add(_generateConstruction(type));
    builder.implements
        .addAll(_generateInterfaces(type, responseTypes, namespace));

    builder.methods.add(_createFromJson(
        '$namespace${type.name}', builder.fields, responseTypes, namespace));
    builder.methods.add(_createToJsonMethod(
        '$namespace${type.name}', builder, enumTypes, namespace));

    return builder.build();
  }

  _generateFields(List<Fields> inputFields, Map<String, DartType> types,
      List<ObjectType> responseTypes, String namespace) {
    List<Field> fields = [];
    inputFields.forEach((field) {
      fields.add(Field((f) {
        if (field.isDeprecated)
          f.annotations.add(Reference(
              "Deprecated('${field.deprecationReason.replaceAll('\n', '')}')"));
        f.name = field.name;
        f.type = Reference(
            Helper.findFieldType(field.type, types, responseTypes, namespace));
        if (field.description != null && field.description.isNotEmpty)
          f.docs.add('/// ${field.description.replaceAll('\n', '\n/// ')}');
      }));
    });
    return fields;
  }

  _createFromJson(String name, ListBuilder<Field> fields,
      List<ObjectType> responseTypes, String namespace) {
    List<ObjectType> enumTypes =
        responseTypes.where((type) => type.kind == Kind.ENUM).toList();
    MethodBuilder fromJsonBuilder = new MethodBuilder();
    String fromJsonBody = "return $name (";
    fromJsonBuilder.returns = Reference("factory");
    fromJsonBuilder.name = '$name.fromJson';
    fromJsonBuilder.requiredParameters.add(Parameter((p) {
      p.name = "json";
      p.type = Reference("Map<String,dynamic>");
    }));
    fields.build().forEach((f) {
      fromJsonBody += _createFromJSONString(f, enumTypes, namespace);
    });
    fromJsonBody += ");";
    fromJsonBuilder.body = Code(fromJsonBody);
    return fromJsonBuilder.build();
  }

  _createFromJSONString(Field f, List<ObjectType> enumTypes, String namespace) {
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

  _createToJsonMethod(String name, ClassBuilder classBuilder,
      List<ObjectType> enumTypes, String namespace) {
    MethodBuilder toJSONBuilder = new MethodBuilder();
    toJSONBuilder.name = "toJson";
    toJSONBuilder.returns = Reference("Map<String,dynamic>");

    String toJsonBody = "return <String,dynamic> {";
    classBuilder.fields.build().forEach((f) {
      toJsonBody += toJsonReturnString(f, enumTypes, namespace);
    });
    toJsonBody += "};";
    toJSONBuilder.body = Code(toJsonBody);
    return toJSONBuilder.build();
  }

  String toJsonReturnString(
      Field f, List<ObjectType> enumTypes, String namespace) {
    switch (f.type.symbol) {
      case "String":
      case "int":
      case "bool":
      case "double":
      case "Map<String,dynamic>":
        return "'${f.name}' : ${f.name},";
      case "dynamic":
        return "'${f.name}' : ${f.name},";
      default:
        if (enumTypes
            .any((type) => '$namespace${type.name}' == f.type.symbol)) {
          return "'${f.name}' : ${f.type.symbol}Enum[${f.name}],";
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
          return "'${f.name}' : ${f.name},";
        default:
          if (enumTypes.any((type) => '$namespace${type.name}' == split)) {
            return "'${f.name}' : ${f.name} == null  ? null : new List<dynamic>.from(${f.name}.map((x) => ${split}Enum[x])),";
          }
      }
      return "'${f.name}' : List<dynamic>.from(${f.name}.map((x) => x.toJson())),";
    } else {
      return "'${f.name}' : ${f.name}.toJson(),";
    }
  }

  _generateConstruction(ObjectType objectType) {
    ConstructorBuilder constructorBuilder = new ConstructorBuilder();
    objectType.fields.forEach((field) {
      constructorBuilder.optionalParameters.add(new Parameter((p) {
        p.name = "${field.name}";
        p.named = true;
        p.toThis = true;
        if (field.type.kind == Kind.NON_NULL)
          p.annotations.add(refer('required', 'package:meta/meta.dart'));
      }));
    });
    return constructorBuilder.build();
  }

  _generateInterfaces(
      ObjectType objectType, List<ObjectType> responseTypes, String namespace) {
    List<ObjectType> unionTypes =
        responseTypes.where((type) => type.kind == Kind.UNION).toList();
    List<Reference> references = [];
    objectType.interfaces.forEach((interface) {
      references.add(Reference('$namespace${interface.name}'));
    });
    unionTypes.forEach((unionType) {
      if (unionType.possibleTypes
          .any((possibleType) => possibleType.name == objectType.name))
        references.add(Reference('$namespace${unionType.name}'));
    });

    return references;
  }
}

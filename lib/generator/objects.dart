import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:graphql_generator/generator/helper.dart';
import 'package:graphql_generator/generator/model.dart';
import 'package:analyzer/dart/element/type.dart';

class ObjectClassGenerator {

  ObjectClassGenerator() {}

  generate(
      Map<String, DartType> types,
      List<ObjectType> enumTypes,
      List<ObjectType> interfaceTypes,
      List<ObjectType> unionTypes,
      List<ObjectType> objectTypes,
      List<ObjectType> inputObjectTypes,
      {String namespace = ""}) {
    Map<String, Class> classes = {};
    objectTypes.forEach((typeObject) {
      classes.putIfAbsent('$namespace${typeObject.name}', () {
        return _generateClass(typeObject, types, enumTypes, interfaceTypes,
            unionTypes, objectTypes, inputObjectTypes, namespace);
      });
    });
    return classes;
  }

  _generateClass(
      ObjectType type,
      Map<String, DartType> types,
      List<ObjectType> enumTypes,
      List<ObjectType> interfaceTypes,
      List<ObjectType> unionTypes,
      List<ObjectType> objectTypes,
      List<ObjectType> inputObjectTypes,
      String namespace) {
    ClassBuilder builder = new ClassBuilder();
    builder.name = '$namespace${type.name}';

    if (type.description != null) {
      String documentation = type.description.replaceAll('\n', '\n/// ');
      builder.docs.add('/// $documentation');
    }

    builder.fields.addAll(_generateFields(type.fields, types, enumTypes,
        interfaceTypes, unionTypes, objectTypes, inputObjectTypes, namespace));
    builder.constructors.add(_generateConstruction(type));
    builder.methods.add(_createFromJson(
        '$namespace${type.name}', builder.fields, enumTypes, namespace));
    builder.implements.addAll(_generateInterfaces(type, unionTypes, namespace));
    return builder.build();
  }

  _generateFields(
      List<Fields> inputFields,
      Map<String, DartType> types,
      List<ObjectType> enumTypes,
      List<ObjectType> interfaceTypes,
      List<ObjectType> unionTypes,
      List<ObjectType> objectTypes,
      List<ObjectType> inputObjectTypes,
      String namespace) {
    List<Field> fields = [];
    inputFields.forEach((field) {
      fields.add(Field((f) {
        if (field.isDeprecated)
          f.annotations.add(Reference(
              "Deprecated('${field.deprecationReason.replaceAll('\n', '')}')"));
        f.name = field.name;
        f.type = Reference(Helper.findFieldType(
            field.type,
            types,
            enumTypes,
            interfaceTypes,
            unionTypes,
            objectTypes,
            inputObjectTypes,
            namespace));
        if (field.description != null)
          f.docs.add('/// ${field.description.replaceAll('\n', '\n/// ')}');
      }));
    });
    return fields;
  }

  _createFromJson(String name, ListBuilder<Field> fields,
      List<ObjectType> enumTypes, String namespace) {
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
      ObjectType objectType, List<ObjectType> unionTypes, String namespace) {
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

import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:graphql_generator/generator/model.dart';

class UnionGenerator {
  UnionGenerator() {}

  Iterable<Class> generate(List<ObjectType> responseTypes,
      {String namespace = ""}) {
    List<ObjectType> unionTypes =
        responseTypes.where((type) => type.kind == Kind.UNION).toList();
    List<ObjectType> enumTypes =
        responseTypes.where((type) => type.kind == Kind.ENUM).toList();
    return unionTypes.map((type) => _generateClass(type, enumTypes, namespace));
  }

  _generateClass(
      ObjectType unionType, List<ObjectType> enumTypes, String namespace) {
    ClassBuilder classBuilder = new ClassBuilder();
    classBuilder.abstract = true;
    classBuilder.name = '$namespace${unionType.name}';
    classBuilder.methods.add(_createFromJsonMethod(unionType, namespace));
    classBuilder.methods.add(_createToJsonMethod('$namespace${unionType.name}',
        classBuilder.fields, enumTypes, namespace));
    return classBuilder.build();
  }

  _createFromJsonMethod(ObjectType unionType, String namespace) {
    MethodBuilder methodBuilder = new MethodBuilder();
    String fromJsonBody = "";
    methodBuilder.name = '$namespace${unionType.name}.fromJson';
    methodBuilder.returns = Reference("factory");
    methodBuilder.requiredParameters.add(Parameter((p) {
      p.name = "json";
      p.type = Reference("Map<String,dynamic>");
    }));
    fromJsonBody += "switch(json['__typename']){";
    unionType.possibleTypes.forEach((type) {
      fromJsonBody +=
          'case "${type.name}" : return $namespace${type.name}.fromJson(json);';
    });
    fromJsonBody += "} return null;";
    methodBuilder.body = Code(fromJsonBody);
    return methodBuilder.build();
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
}

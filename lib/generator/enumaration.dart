import 'package:graphql_generator/generator/model.dart';

class EnumGenerator {
  EnumGenerator() {}

  List<String> enumGenerator(
  List<ObjectType> responseTypes,
      {String namespace = ""}) {

    List<ObjectType> enumTypes = responseTypes.where((type) => type.kind == Kind.ENUM).toList();
    List<String> enumString = [];
    enumTypes.forEach((enumType) {
      enumString
          .add(" enum $namespace${enumType.name} {${_getEnumArray(enumType)}}");
      enumString.add(
          " const $namespace${enumType.name}Values = {${_getEnumMapValues(enumType, namespace)}};");
      enumString.add(
          "const $namespace${enumType.name}Enum = {${_getEnumMapString(enumType, namespace)}};");
    });
    return enumString;
  }

  _getEnumArray(ObjectType type) {
    String result = '';
    type.enumValues.forEach((e) {
      result += '${e.name} ,';
    });
    result.replaceFirst(RegExp(','), '', result.lastIndexOf(RegExp(',')));
    return result;
  }

  _getEnumMapValues(ObjectType type, String namespace) {
    String result = '';
    type.enumValues.forEach((e) {
      result += '"${e.name}" : $namespace${type.name}.${e.name},';
    });
    return result;
  }

  _getEnumMapString(ObjectType type, String namespace) {
    String result = '';
    type.enumValues.forEach((e) {
      result += '$namespace${type.name}.${e.name} : "${e.name}",';
    });
    return result;
  }
}

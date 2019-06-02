import 'package:graphql_generator/generator/model.dart';

class EnumGenerator {
  List<ObjectType> enumTypes = [];
  String namespace = '';

  EnumGenerator() {
  }

  List<String> enumGenerator(List<ObjectType> enumTypes, String namespace) {
    this.namespace = namespace;
    List<String> enumString = [];
    enumTypes.forEach((enumType) {
      enumString.add(
          " enum $namespace${enumType.name} {${_getEnumArray(enumType)}}");
      enumString.add(
          " const $namespace${enumType.name}Values = {${_getEnumMapValues(
              enumType)}};");
      enumString.add(
          "const $namespace${enumType.name}Enum = {${_getEnumMapString(
              enumType)}};");
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

  _getEnumMapValues(ObjectType type) {
    String result = '';
    type.enumValues.forEach((e) {
      result += '"${e.name}" : $namespace${type.name}.${e.name},';
    });
    return result;
  }

  _getEnumMapString(ObjectType type) {
    String result = '';
    type.enumValues.forEach((e) {
      result += '$namespace${type.name}.${e.name} : "${e.name}",';
    });
    return result;
  }
}

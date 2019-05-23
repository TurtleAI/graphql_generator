import 'generator.dart';
import 'model.dart';

class EnumGenerator {
  static final EnumGenerator _singleton = new EnumGenerator._internal();
  List<TypeA> enumTypes = [];

  factory EnumGenerator() {
    return _singleton;
  }

  EnumGenerator._internal();

  List<String> enumGenerator(List<TypeA> enumTypes) {
    List<String> enumString = [];
    enumTypes.forEach((enumType) {
      enumString.add(
          " enum ${GraphQLGenerators().namespace}${enumType.name} {${_getEnumArray(enumType)}}");
      enumString.add(
          " const ${GraphQLGenerators().namespace}${enumType.name}Values = {${_getEnumMapValues(enumType)}};");
    });
    return enumString;
  }

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
      result += '"${e.name}" : ${GraphQLGenerators().namespace}${type.name}.${e.name},';
    });
    return result;
  }
}

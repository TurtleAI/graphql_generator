import 'package:analyzer/dart/element/type.dart';
import 'package:graphql_generator/generator/model.dart';

class Helper {
  static String findFieldType(Interface type, Map<String, DartType> types,
      List<ObjectType> responseTypes, String namespace) {
    if (type.name != null) {
      return _mapFieldType(type.name, types, responseTypes, namespace);
    }
    if (type.kind != null) {
      if (type.kind == Kind.LIST) {
        return "List<${findFieldType(type.ofType, types, responseTypes, namespace)}>";
      }
    }
    return findFieldType(type.ofType, types, responseTypes, namespace);
  }

  static String _mapFieldType(String name, Map<String, DartType> types,
      List<ObjectType> responseTypes, String namespace) {
    List<ObjectType> enumTypes =
        responseTypes.where((type) => type.kind == Kind.ENUM).toList();
    List<ObjectType> interfaceTypes =
        responseTypes.where((type) => type.kind == Kind.INTERFACE).toList();
    List<ObjectType> unionTypes =
        responseTypes.where((type) => type.kind == Kind.UNION).toList();
    List<ObjectType> objectTypes =
        responseTypes.where((type) => type.kind == Kind.OBJECT).toList();
    List<ObjectType> inputObjectTypes =
        responseTypes.where((type) => type.kind == Kind.INPUT_OBJECT).toList();
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
        if (enumTypes.any((type) => type.name == name) ||
            interfaceTypes.any((type) => type.name == name) ||
            unionTypes.any((type) => type.name == name) ||
            objectTypes.any((type) => type.name == name) ||
            inputObjectTypes.any((type) => type.name == name))
          return '${namespace}$name';
        else
          return 'String';
    }
  }
}
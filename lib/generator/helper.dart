import 'package:analyzer/dart/element/type.dart';
import 'package:graphql_generator/generator/model.dart';

class Helper {
  static String findFieldType(
      Interface type,
      Map<String, DartType> types,
      List<ObjectType> enumTypes,
      List<ObjectType> interfaceTypes,
      List<ObjectType> unionTypes,
      List<ObjectType> objectTypes,
      List<ObjectType> inputObjectTypes,
      String namespace) {
    if (type.name != null) {
      return _mapFieldType(type.name, types, enumTypes, interfaceTypes,
          unionTypes, objectTypes, inputObjectTypes, namespace);
    }
    if (type.kind != null) {
      if (type.kind == Kind.LIST) {
        return "List<${findFieldType(type.ofType, types, enumTypes, interfaceTypes, unionTypes, objectTypes, inputObjectTypes, namespace)}>";
      }
    }
    return findFieldType(type.ofType, types, enumTypes, interfaceTypes,
        objectTypes, unionTypes, inputObjectTypes, namespace);
  }

  static String _mapFieldType(
      String name,
      Map<String, DartType> types,
      List<ObjectType> enumTypes,
      List<ObjectType> interfaceTypes,
      List<ObjectType> unionTypes,
      List<ObjectType> objectTypes,
      List<ObjectType> inputObjectTypes,
      String namespace) {
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

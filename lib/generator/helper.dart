import 'package:analyzer/dart/element/type.dart';
import 'package:graphql_generator/generator/code_generator.dart';
import 'package:graphql_generator/generator/model.dart';

class Helper {

  static String findFieldType(InterfaceA type) {
    if (type.name != null) {
      return _mapFieldType(type.name);
    }
    if (type.kind != null) {
      if (type.kind == Kind.LIST) {
        return "List<${findFieldType(type.ofType)}>";
      }
    }
    return findFieldType(type.ofType);
  }

  static String _mapFieldType(String name) {
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
}
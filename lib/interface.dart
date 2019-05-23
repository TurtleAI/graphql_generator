import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';

import 'generator.dart';
import 'model.dart';

class InterfaceGenerator {
  static final InterfaceGenerator _singleton =
      new InterfaceGenerator._internal();
  List<TypeA> interfaceTypes = [];
  Map<String, Class> interfaces = {};

  factory InterfaceGenerator() {
    return _singleton;
  }

  InterfaceGenerator._internal();

  interfaceGenerator(List<TypeA> interfaceTypes) {
    this.interfaceTypes = interfaceTypes;
    return _parseInterface();
  }

  _parseInterface() {
    Map<String, Class> classes = {};
    interfaceTypes.forEach((interfaceType) {
      classes.putIfAbsent(interfaceType.name, () {
        return _generateClass(interfaceType);
      });
    });
    return classes;
  }

  _generateClass(TypeA interfaceType) {
    ClassBuilder classBuilder = new ClassBuilder();
    classBuilder.abstract = true;
    classBuilder.name = '${GraphQLGenerators().namespace}${interfaceType.name}';
    classBuilder.fields.addAll(_generateFields(interfaceType.fields));
    classBuilder.methods.add(_generateMethod(interfaceType));
    return classBuilder.build();
  }

  _generateFields(List<Fields> interfaceFields) {
    List<Field> fields = [];
    interfaceFields.forEach((field) {
      fields.add(Field((f) {
        f.name = field.name;
        f.type = Reference(_findFieldType(field.type));
      }));
    });
    return fields;
  }

  String _findFieldType(InterfaceA type, {bool isList}) {
    if (type.name != null) {
      return _mapFieldType(type.name);
    }
    if (type.kind != null) {
      if (type.kind == Kind.LIST) {
        return "List<${_findFieldType(type.ofType)}>";
      }
    }
    return _findFieldType(type.ofType);
  }

  _mapFieldType(String name) {
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

  _generateMethod(TypeA interfaceType) {
    MethodBuilder methodBuilder = new MethodBuilder();
    String fromJsonBody = "";
    methodBuilder.name =
        '${GraphQLGenerators().namespace}${interfaceType.name}.fromJson';
    methodBuilder.returns = Reference("factory");
    methodBuilder.requiredParameters.add(Parameter((p) {
      p.name = "json";
      p.type = Reference("Map<String,dynamic>");
    }));
    fromJsonBody += "switch(json['__typename']){";
    interfaceType.possibleTypes.forEach((type) {
      fromJsonBody +=
          'case "${type.name}" : return ${GraphQLGenerators().namespace}${type.name}.fromJson(json);';
    });
    fromJsonBody += "} return null;";
    methodBuilder.body = Code(fromJsonBody);
    return methodBuilder.build();
  }
}

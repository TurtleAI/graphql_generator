import 'package:analyzer/dart/element/type.dart';

import 'model.dart';

class GraphQLGenerator {
  String namespace;
  Map<String, DartType> types = {};
  Map<String, String> fragments = {};

  List<TypeA> responseTypes;
  List<TypeA> enumTypes = [];
  List<TypeA> interfaceTypes = [];
  List<TypeA> unionTypes = [];
  List<TypeA> objectTypes = [];
  List<TypeA> inputObjectTypes = [];

  static final GraphQLGenerator _singleton = new GraphQLGenerator._internal();

  factory GraphQLGenerator() {
    return _singleton;
  }

  GraphQLGenerator._internal();

  String graphQLGenerate(List<TypeA> responseTypes, Map<String, DartType> types,
      Map<String, String> fragments) {
    this.responseTypes = responseTypes;
    this.types = types;
    this.fragments = fragments;
    generateModels();

  }

  generateModels() {
    enumTypes = responseTypes.where((type) => type.kind == Kind.ENUM).toList();
    interfaceTypes =
        responseTypes.where((type) => type.kind == Kind.INTERFACE).toList();
    unionTypes =
        responseTypes.where((type) => type.kind == Kind.UNION).toList();
    inputObjectTypes =
        responseTypes.where((type) => type.kind == Kind.INPUT_OBJECT).toList();
    objectTypes =
        responseTypes.where((type) => type.kind == Kind.OBJECT).toList();
  }
}

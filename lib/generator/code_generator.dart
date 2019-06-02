import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:graphql_generator/generator/enumaration.dart';
import 'package:graphql_generator/generator/input_object.dart';
import 'package:graphql_generator/generator/interface.dart';
import 'package:graphql_generator/generator/model.dart';
import 'package:graphql_generator/generator/mutation.dart';
import 'package:graphql_generator/generator/objects.dart';
import 'package:graphql_generator/generator/union.dart';

class GraphQLCodeGenerators {
  static final GraphQLCodeGenerators _singleton = new GraphQLCodeGenerators
      ._internal();

  factory GraphQLCodeGenerators() {
    return _singleton;
  }

  GraphQLCodeGenerators._internal();

  String namespace;
  Map<String, DartType> types = {};
  Map<String, String> fragments = {};

  List<ObjectType> responseTypes;
  List<ObjectType> enumTypes = [];
  List<ObjectType> interfaceTypes = [];
  List<ObjectType> unionTypes = [];
  List<ObjectType> objectTypes = [];
  List<ObjectType> inputObjectTypes = [];

  ObjectType mutation;
  String mutationClassName;

  Map<String, Class> classes = {};


  graphQLGenerate(List<ObjectType> responseTypes,
      String namespace,
      Map<String, DartType> types,
      Map<String, String> fragments,
      String mutationClassName) {
    this.namespace = namespace;
    this.responseTypes = responseTypes;
    this.types = types;
    this.fragments = fragments;
    this.mutationClassName = mutationClassName;
    splitTypes();
    return generateTypes();
  }

  splitTypes() {
    enumTypes = responseTypes.where((type) => type.kind == Kind.ENUM).toList();
    interfaceTypes =
        responseTypes.where((type) => type.kind == Kind.INTERFACE).toList();
    unionTypes =
        responseTypes.where((type) => type.kind == Kind.UNION).toList();
    inputObjectTypes =
        responseTypes.where((type) => type.kind == Kind.INPUT_OBJECT).toList();
    objectTypes =
        responseTypes.where((type) => type.kind == Kind.OBJECT).toList();
    mutation = responseTypes
        .where((type) => type.name == mutationClassName)
        .toList()
        .first;
  }

  generateTypes() {
    var result = '';
    var emitter = DartEmitter(Allocator());
    List<String> enumString =
    EnumGenerator().enumGenerator(enumTypes, namespace);
    Map<String, Class> interfaces =
    InterfaceGenerator().interfaceGenerator(interfaceTypes, namespace);
    Map<String, Class> unions =
    UnionGenerator().unionGenerator(unionTypes, namespace);
    Map<String, Class> inputs = InputObjectGenerator()
        .inputObjectGenerator(inputObjectTypes, namespace, enumTypes);
    Map<String, Class> objects = ObjectClassGenerator()
        .objectClassGenerator(objectTypes, namespace, enumTypes, unionTypes);

    classes.addAll(interfaces);
    classes.addAll(unions);
    classes.addAll(inputs);
    classes.addAll(objects);

    classes.addAll(MutationClassGenerator()
        .mutationClassGenerator(namespace, classes, fragments, mutation));
    Library library = new Library((lib) => lib.body.addAll(classes.values));
    result += DartFormatter().format('${library.accept(emitter)}');
    enumString.forEach((enumString) {
      result += DartFormatter().format(enumString);
    });

    return result;
  }
}

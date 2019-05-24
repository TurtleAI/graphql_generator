import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:graphql_generator/enumaration.dart';
import 'package:graphql_generator/generator/input_object.dart';
import 'package:graphql_generator/generator/interface.dart';
import 'package:graphql_generator/generator/model.dart';
import 'package:graphql_generator/generator/mutation.dart';
import 'package:graphql_generator/generator/objects.dart';
import 'package:graphql_generator/generator/union.dart';

class GraphQLCodeGenerators {
  static final GraphQLCodeGenerators _singleton = new GraphQLCodeGenerators._internal();
  String namespace;
  Map<String, DartType> types = {};
  Map<String, String> fragments = {};

  List<TypeA> responseTypes;
  List<TypeA> enumTypes = [];
  List<TypeA> interfaceTypes = [];
  List<TypeA> unionTypes = [];
  List<TypeA> objectTypes = [];
  List<TypeA> inputObjectTypes = [];

  TypeA mutation;
  String mutationClassName;

  Map<String,Class> classes = {};

  factory GraphQLCodeGenerators() {
    return _singleton;
  }

  GraphQLCodeGenerators._internal();

  graphQLGenerate(
      List<TypeA> responseTypes,
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
    List<String> enumString = EnumGenerator().enumGenerator(enumTypes);
    Map<String, Class> interfaces =
        InterfaceGenerator().interfaceGenerator(interfaceTypes);
    Map<String, Class> unions = UnionGenerator().unionGenerator(unionTypes);
    Map<String, Class> inputs =
        InputObjectGenerator().inputObjectGenerator(inputObjectTypes);
    Map<String, Class> objects =
        ObjectClassGenerator().objectClassGenerator(objectTypes);

    classes.addAll(interfaces);
    classes.addAll(unions);
    classes.addAll(inputs);
    classes.addAll(objects);

    classes.addAll(MutationClassGenerator().mutationClassGenerator());
    print("END");
    Library library = new Library((lib) => lib.body.addAll(classes.values));
    result += DartFormatter().format('${library.accept(emitter)}');
    enumString.forEach((enumString) {
      result += DartFormatter().format(enumString);
    });

    return result;
  }
}

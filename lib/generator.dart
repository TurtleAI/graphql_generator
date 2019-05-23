import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'enumaration.dart';
import 'input_object.dart';
import 'interface.dart';
import 'model.dart';
import 'objects.dart';
import 'union.dart';

class GraphQLGenerators {
  String namespace;
  Map<String, DartType> types = {};
  Map<String, String> fragments = {};

  List<TypeA> responseTypes;
  List<TypeA> enumTypes = [];
  List<TypeA> interfaceTypes = [];
  List<TypeA> unionTypes = [];
  List<TypeA> objectTypes = [];
  List<TypeA> inputObjectTypes = [];

  static final GraphQLGenerators _singleton = new GraphQLGenerators._internal();

  factory GraphQLGenerators() {
    return _singleton;
  }

  GraphQLGenerators._internal();

  graphQLGenerate(List<TypeA> responseTypes,String namespace, Map<String, DartType> types, Map<String, String> fragments) {
    this.namespace = namespace;
    this.responseTypes = responseTypes;
    this.types = types;
    this.fragments = fragments;
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
  }

  generateTypes() {
    var result = '';
    var emitter = DartEmitter(Allocator());
    List<String> enumString = EnumGenerator().enumGenerator(enumTypes);
    Map<String, Class> interfaces = InterfaceGenerator().interfaceGenerator(interfaceTypes);
    Map<String, Class> unions = UnionGenerator().unionGenerator(unionTypes);
    Map<String, Class> inputs = InputObjectGenerator().inputObjectGenerator(inputObjectTypes);
    Map<String,Class> objects = ObjectClassGenerator().objectClassGenerator(objectTypes);

    print("Parsing");
    Map<String,Class> classes  = {};
    classes.addAll(interfaces);
    classes.addAll(unions);
    classes.addAll(inputs);
    classes.addAll(objects);

    print("Parsing done $classes");
    Library library = new Library((lib) => lib.body.addAll(classes.values));
    result += DartFormatter().format('${library.accept(emitter)}');
    enumString.forEach((enumString) {
      result += DartFormatter().format(enumString);
    });

    return result;
  }
}

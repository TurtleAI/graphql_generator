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
  generate(
      List<ObjectType> responseTypes,
      String namespace,
      Map<String, DartType> types,
      Map<String, String> fragments,
      String mutationClassName) {
    ObjectType mutationObjectType =
        getMutationObjectType(responseTypes, mutationClassName);

    return generateTypes(
        namespace, fragments, types, responseTypes, mutationObjectType);
  }

  ObjectType getMutationObjectType(
      List<ObjectType> responseTypes, String mutationClassName) {
    ObjectType mutationObjectType = responseTypes
        .where((type) => type.name == mutationClassName)
        .toList()
        .first;
    return mutationObjectType;
  }

  generateTypes(
      String namespace,
      Map<String, String> fragments,
      Map<String, DartType> types,
      List<ObjectType> responseTypes,
      ObjectType mutationObjectType) {
    var result = '';
    var emitter = DartEmitter(Allocator());
    Map<String, Class> classes = {};

    List<String> enumString =
        EnumGenerator().enumGenerator(responseTypes, namespace: namespace);
    Map<String, Class> interfaces = InterfaceGenerator()
        .generate(types, responseTypes, namespace: namespace);
    Map<String, Class> unions =
        UnionGenerator().generate(responseTypes, namespace: namespace);
    Map<String, Class> inputs = InputObjectGenerator()
        .generate(types, responseTypes, namespace: namespace);
    Map<String, Class> objects = ObjectClassGenerator()
        .generate(types, responseTypes, namespace: namespace);

    classes.addAll(interfaces);
    classes.addAll(unions);
    classes.addAll(inputs);
    classes.addAll(objects);
    classes.addAll(MutationClassGenerator().generate(
        classes, fragments, mutationObjectType, types, responseTypes,
        namespace: namespace));
    // var sortedKeys = classes.keys.toList()..sort();

    Library library = new Library((lib) => lib.body.addAll(classes.values));
    result += DartFormatter().format('${library.accept(emitter)}');
    enumString.forEach((enumString) {
      result += DartFormatter().format(enumString);
    });

    return result;
  }
}

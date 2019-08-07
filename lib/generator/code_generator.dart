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
  String generateDartCode(
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

  String generateTypes(
      String namespace,
      Map<String, String> fragments,
      Map<String, DartType> types,
      List<ObjectType> responseTypes,
      ObjectType mutationObjectType) {
    var result = '';
    var emitter = DartEmitter(Allocator());

    var enumString =
        EnumGenerator().enumGenerator(responseTypes, namespace: namespace);
    var interfaces = InterfaceGenerator()
        .generate(types, responseTypes, namespace: namespace);
    var unions = UnionGenerator().generate(responseTypes, namespace: namespace);
    var inputs = InputObjectGenerator()
        .generate(types, responseTypes, namespace: namespace);
    var objects = ObjectClassGenerator()
        .generate(types, responseTypes, namespace: namespace);

    var classes = [
      ...interfaces,
      ...inputs,
      ...unions,
      ...objects,
    ];
    var mutationClass = MutationClassGenerator().generate(
        classes, fragments, mutationObjectType, types, responseTypes,
        namespace: namespace);
    classes.add(mutationClass);
    classes.sort((a, b) => a.name.compareTo(b.name));
    Library library = new Library((lib) => lib.body.addAll(classes));
    result += DartFormatter().format('${library.accept(emitter)}');
    enumString.forEach((enumString) {
      result += DartFormatter().format(enumString);
    });

    return result;
  }
}

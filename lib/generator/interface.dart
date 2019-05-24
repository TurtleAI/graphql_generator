import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';
import 'package:graphql_generator/generator/code_generator.dart';
import 'package:graphql_generator/generator/helper.dart';
import 'package:graphql_generator/generator/model.dart';

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
      classes.putIfAbsent('${GraphQLGenerators().namespace}${interfaceType.name}', () {
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
        f.type = Reference(Helper.findFieldType(field.type));
      }));
    });
    return fields;
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

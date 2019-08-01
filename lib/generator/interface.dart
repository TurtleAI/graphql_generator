import 'package:code_builder/code_builder.dart';
import 'package:graphql_generator/generator/helper.dart';
import 'package:graphql_generator/generator/model.dart';
import 'package:analyzer/dart/element/type.dart';

class InterfaceGenerator {
  InterfaceGenerator() {}

  generate(
      Map<String, DartType> types,
      List<ObjectType> enumTypes,
      List<ObjectType> interfaceTypes,
      List<ObjectType> unionTypes,
      List<ObjectType> objectTypes,
      List<ObjectType> inputObjectTypes,
      {String namespace = ""}) {
    Map<String, Class> classes = {};
    interfaceTypes.forEach((interfaceType) {
      classes.putIfAbsent('$namespace${interfaceType.name}', () {
        return _generateClass(interfaceType, types, enumTypes, interfaceTypes,
            unionTypes, objectTypes, inputObjectTypes,namespace);
      });
    });
    return classes;
  }

  _generateClass(ObjectType interfaceType, Map<String, DartType> types,
      List<ObjectType> enumTypes,
      List<ObjectType> interfaceTypes,
      List<ObjectType> unionTypes,
      List<ObjectType> objectTypes,
      List<ObjectType> inputObjectTypes,String namespace) {
    ClassBuilder classBuilder = new ClassBuilder();
    classBuilder.abstract = true;
    classBuilder.name = '$namespace${interfaceType.name}';
    classBuilder.fields.addAll(_generateFields(interfaceType.fields,types, enumTypes, interfaceTypes,
            unionTypes, objectTypes, inputObjectTypes,namespace));
    classBuilder.methods
        .add(_generateMethod(interfaceType, namespace: namespace));
    return classBuilder.build();
  }

  _generateFields(List<Fields> interfaceFields,Map<String, DartType> types,
      List<ObjectType> enumTypes,
      List<ObjectType> interfaceTypes,
      List<ObjectType> unionTypes,
      List<ObjectType> objectTypes,
      List<ObjectType> inputObjectTypes,String namespace) {
    List<Field> fields = [];
    interfaceFields.forEach((field) {
      fields.add(Field((f) {
        f.name = field.name;
        f.type = Reference(Helper.findFieldType(field.type,types, enumTypes, interfaceTypes,
            unionTypes, objectTypes, inputObjectTypes,namespace));
      }));
    });
    return fields;
  }

  _generateMethod(ObjectType interfaceType, {String namespace = ""}) {
    MethodBuilder methodBuilder = new MethodBuilder();
    String fromJsonBody = "";
    methodBuilder.name = '$namespace${interfaceType.name}.fromJson';
    methodBuilder.returns = Reference("factory");
    methodBuilder.requiredParameters.add(Parameter((p) {
      p.name = "json";
      p.type = Reference("Map<String,dynamic>");
    }));
    fromJsonBody += "switch(json['__typename']){";
    interfaceType.possibleTypes.forEach((type) {
      fromJsonBody +=
          'case "${type.name}" : return $namespace${type.name}.fromJson(json);';
    });
    fromJsonBody += "} return null;";
    methodBuilder.body = Code(fromJsonBody);
    return methodBuilder.build();
  }
}

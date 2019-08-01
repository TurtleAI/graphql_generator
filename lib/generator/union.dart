import 'package:code_builder/code_builder.dart';
import 'package:graphql_generator/generator/model.dart';
import 'package:analyzer/dart/element/type.dart';

class UnionGenerator {
  UnionGenerator() {}

  generate(List<ObjectType> unionTypes, {String namespace = ""}) {
    Map<String, Class> classes = {};
    unionTypes.forEach((unionType) {
      classes.putIfAbsent('$namespace${unionType.name}', () {
        return _generateClass(unionType, namespace);
      });
    });
    return classes;
  }

  _generateClass(ObjectType unionType, String namespace) {
    ClassBuilder classBuilder = new ClassBuilder();
    classBuilder.abstract = true;
    classBuilder.name = '$namespace${unionType.name}';
    classBuilder.methods.add(_generateMethod(unionType, namespace));
    return classBuilder.build();
  }

  _generateMethod(ObjectType unionType, String namespace) {
    MethodBuilder methodBuilder = new MethodBuilder();
    String fromJsonBody = "";
    methodBuilder.name = '$namespace${unionType.name}.fromJson';
    methodBuilder.returns = Reference("factory");
    methodBuilder.requiredParameters.add(Parameter((p) {
      p.name = "json";
      p.type = Reference("Map<String,dynamic>");
    }));
    fromJsonBody += "switch(json['__typename']){";
    unionType.possibleTypes.forEach((type) {
      fromJsonBody +=
          'case "${type.name}" : return $namespace${type.name}.fromJson(json);';
    });
    fromJsonBody += "} return null;";
    methodBuilder.body = Code(fromJsonBody);
    return methodBuilder.build();
  }
}

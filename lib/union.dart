import 'package:code_builder/code_builder.dart';
import 'package:graphql_generator/model.dart';

import 'generator.dart';

class UnionGenerator {
  static final UnionGenerator _singleton = new UnionGenerator._internal();

  factory UnionGenerator() {
    return _singleton;
  }

  UnionGenerator._internal();

  unionGenerator(List<TypeA> unionTypes) {
    Map<String, Class> classes = {};
    unionTypes.forEach((unionType) {
      classes.putIfAbsent(unionType.name, () {
        return _generateClass(unionType);
      });
    });
    return classes;
  }

  _generateClass(TypeA unionType) {
    ClassBuilder classBuilder = new ClassBuilder();
    classBuilder.abstract = true;
    classBuilder.name = '${GraphQLGenerator().namespace}${unionType.name}';
    classBuilder.methods.add(_generateMethod(unionType));
    return classBuilder.build();
  }

  _generateMethod(TypeA unionType) {
    MethodBuilder methodBuilder = new MethodBuilder();
    String fromJsonBody = "";
    methodBuilder.name =
        '${GraphQLGenerator().namespace}${unionType.name}.fromJson';
    methodBuilder.returns = Reference("factory");
    methodBuilder.requiredParameters.add(Parameter((p) {
      p.name = "json";
      p.type = Reference("Map<String,dynamic>");
    }));
    fromJsonBody += "switch(json['__typename']){";
    unionType.possibleTypes.forEach((type) {
      fromJsonBody +=
          'case "${type.name}" : return ${GraphQLGenerator().namespace}${type.name}.fromJson(json);';
    });
    fromJsonBody += "} return null;";
    methodBuilder.body = Code(fromJsonBody);
    return methodBuilder.build();
  }
}
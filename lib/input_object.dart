import 'package:code_builder/code_builder.dart';

import 'generator.dart';
import 'model.dart';

class InputObjectGenerator {
  static final InputObjectGenerator _singleton =
  new InputObjectGenerator._internal();

  factory InputObjectGenerator() {
    return _singleton;
  }

  InputObjectGenerator._internal();

  inputObjectGenerator(List<TypeA> inputObjectTypes){
    Map<String,Class> classes = {};
    inputObjectTypes.forEach((typeObject) {
      classes.putIfAbsent(typeObject.name, () {
        return _generateClass(typeObject);
      });
    });
  }

  _generateClass(TypeA type) {
    ClassBuilder builder = new ClassBuilder();
    builder.name = '${GraphQLGenerator().namespace}${type.name}';
    builder.fields.addAll(_generateFields(type.inputFields));

  }

  _generateFields(List<InputField> inputFields) {
    List<Field> fields = [];
    inputFields.forEach((field) {
      fields.add(Field((f) {
        f.name = field.name;
//        f.type = Reference(findFieldType(field.type));
        if (field.description != null)
          f.docs.add('/// ${field.description.replaceAll('\n', '\n/// ')}');
      }));
    });
  }

  String _findFieldType(InterfaceA type, {bool isList}) {

  }

  _mapFieldType(String name) {

  }

  _generateMethod(TypeA interfaceType) {
//    MethodBuilder toJSONBuilder = new MethodBuilder();
//    toJSONBuilder.name = "toJson";
//    toJSONBuilder.returns = Reference("Map<String,dynamic>");
//    if (interfaceType.inputFields != null) {
//      interfaceType.inputFields.forEach((field) {
//        constructorBuilder.optionalParameters.add(new Parameter((p) {
//          p.name = "${f.name}";
//          p.named = true;
//          p.toThis = true;
//          if (field.type.kind == Kind.NON_NULL)
//            p.annotations.add(refer('required', 'package:meta/meta.dart'));
//        }));
//      });
//      builder.methods.addAll(createInputMethods(builder));
//    }
  }
}

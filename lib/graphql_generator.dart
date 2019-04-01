library graphql_generator;

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:graphql_generator/annotation.dart';
import 'package:graphql_generator/model.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'package:source_gen/source_gen.dart';

class GraphQLGenerator extends GeneratorForAnnotation<GQLGenerator> {

  var url;
  var headerToken;
  var namespace;

  Map<String, Class> classes = {};
  List<String> enumString =[];

  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    url = annotation.read('url').stringValue;
    headerToken = annotation.read('headerToken').stringValue;
    namespace = annotation.read('namespace').stringValue;

    var response = await getSchema();
    parseAllTypes(getTypesFromResponse(response));

    ///Concat and return the String value back.
    var result = '';
    var emitter = DartEmitter();
    classes.forEach((className, classObject) {
      result += DartFormatter().format('${classObject.accept(emitter)}');
    });
    enumString.forEach((enumString){
      result += DartFormatter().format(enumString);
    });
    return result;
  }

  /// Fetch the schema from the given url and header.
  Future<http.Response> getSchema() async {
    http.Response response = await new http.Client()
        .post(url,
            headers: headerToken != null
                ? {
                    'Content-type': 'application/json',
                    'Authorization': headerToken
                  }
                : {'Content-type': 'application/json'},
            body:
                '{"query" : "fragment FullType on __Type { kind name description fields(includeDeprecated: true) { name description args { ...InputValue } type { ...TypeRef } isDeprecated deprecationReason } inputFields { ...InputValue } interfaces { ...TypeRef } enumValues(includeDeprecated: true) { name description isDeprecated deprecationReason } possibleTypes { ...TypeRef } } fragment InputValue on __InputValue { name description type { ...TypeRef } defaultValue } fragment TypeRef on __Type { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name } } } } } } } } query IntrospectionQuery { __schema { queryType { name } mutationType { name } types { ...FullType } directives { name description locations args { ...InputValue } } } } "}')
        .whenComplete(() => print('completed'));
    return response;
  }

  /// Get all the types array from the response.
  getTypesFromResponse(http.Response response) {
    Map<String, dynamic> json = JSON.jsonDecode(response.body);
    Map<String, dynamic> jsonData = json['data'];
    Map<String, dynamic> jsonSchema = jsonData['__schema'];
    List<dynamic> types = jsonSchema["types"];
    return types;
  }

  /// Create the root class with the namespace name given in the annotation.
  parseAllTypes(List<dynamic> types) {
    Class rootClass = Class((root) {
      root..name = namespace;
      types.forEach((t) {
        Type type = Type.fromJson(t);
        setFields(type, root);
      });
    });
    classes.putIfAbsent(namespace, () {
      return rootClass;
    });
  }

  /// Set the fields to the class object
  setFields(Type type, ClassBuilder rootClass) {
    if (type.kind == Kind.OBJECT) {
      rootClass.fields.add(Field((f){
        f.name = type.name.toLowerCase();
        f.type = Reference(type.name);
      }));
      parseObjectType(type);
    } else if (type.kind == Kind.ENUM) {
      rootClass.fields.add(Field((f){
        f.name = type.name.toLowerCase();
        f.type = Reference(type.name);
      }));
      parseEnumType(type);
    }
  }

  /// Parse the type @[Kind.OBJECT]
  parseObjectType(Type type) {
    classes.putIfAbsent(type.name, () {
      return Class((root) {
        root.name = type.name;
        if (type.fields != null) {
          type.fields.forEach((field) {
            root.fields.add(Field((f){
              f.name =  field.name;
              f.type = Reference(findFieldType(field.type));
            }));
          });
        }
      });
    });
  }

  /// Loop to find the field types
  findFieldType(Interface type){
    while(true){
      if(type.name != null) {
        return mapFieldType(type.name);
      }
      type = type.ofType;
    }
  }

  /// Map the FieldTypes to Dart objects
  mapFieldType(String name) {
    switch(name){
      case 'Date':
        return 'DateTime';
      case 'Boolean':
        return 'bool';
      case 'Int':
        return 'int';
      case 'Float':
        return 'float';
      case 'ID':
        return 'int';
      default:
        return name;
    }
  }

  /// Parse the type @[Kind.ENUM]
  parseEnumType(Type type){
    enumString.add(" enum ${type.name} {${_getEnumArray(type)}}");
  }

  /// Convert Enum items to String
  _getEnumArray(Type type) {
    String result = '';
    type.enumValues.forEach((e){
      result += '${e.name} ,';
    });
    result.replaceFirst(RegExp(','),'',result.lastIndexOf(RegExp(',')));
    return result;
  }
}

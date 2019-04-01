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

  String url;
  String headerToken;
  String namespace;

  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    url = annotation.read('url').stringValue;
    headerToken = annotation.read('headerToken').stringValue;
    namespace = annotation.read('namespace').stringValue;

    final animal = await getSchema();
    final emitter = DartEmitter();
    return DartFormatter().format('${animal.accept(emitter)}');
  }

  Future<Class> getSchema() async {
    http.Response response = await new http.Client()
        .post(url,
        headers: {
          'Content-type': 'application/json',
          'Authorization': headerToken
        },
        body:
        '{"query" : "fragment FullType on __Type { kind name description fields(includeDeprecated: true) { name description args { ...InputValue } type { ...TypeRef } isDeprecated deprecationReason } inputFields { ...InputValue } interfaces { ...TypeRef } enumValues(includeDeprecated: true) { name description isDeprecated deprecationReason } possibleTypes { ...TypeRef } } fragment InputValue on __InputValue { name description type { ...TypeRef } defaultValue } fragment TypeRef on __Type { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name } } } } } } } } query IntrospectionQuery { __schema { queryType { name } mutationType { name } types { ...FullType } directives { name description locations args { ...InputValue } } } } "}')
        .whenComplete(() => print('completed'));

    return parseTypes(getTypes(response));
  }

  getTypes(http.Response response){
    Map<String, dynamic> json = JSON.jsonDecode(response.body);
    Map<String, dynamic> jsonData = json['data'];
    Map<String, dynamic> jsonSchema = jsonData['__schema'];
    List<dynamic> types = jsonSchema["types"];
    return types;
  }

  Class parseTypes(List<dynamic> types){
    Class mainClass = Class((root){
      root..name = namespace;
      types.forEach((t){
        Type type = Type.fromJson(t);
        if(type.kind == Kind.SCALAR)
          root.fields.add(Field((c) {
            c.name = type.name;
            c.type = Reference("String");
          }));
        else if(type.kind == Kind.OBJECT)
          root.fields.add(Field((c){
            c.name = type.name;
            c.type = Reference(type.name);
          }));
      });
    });

    return mainClass;
  }
}

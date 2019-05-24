library graphql_generator;

import 'dart:convert' as JSON;

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:graphql_generator/annotation.dart';
import 'package:graphql_generator/generator/code_generator.dart';
import 'package:http/http.dart' as http;
import 'package:source_gen/source_gen.dart';

import 'package:graphql_generator/generator/model.dart';

class GraphQLGenerators extends GeneratorForAnnotation<GQLGenerator> {
  var url;
  var headerToken;
  String namespace = 'T';

  String mutationType = "";

  Map<String, DartType> types = {};
  Map<String, String> fragments = {};

  TypeA mutation = new TypeA();

  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    url = annotation.read('url').stringValue;
    if (!annotation.read('headerToken').isNull)
      headerToken = annotation.read('headerToken').stringValue;
    if (!annotation.read('namespace').isNull)
      namespace = annotation.read('namespace').stringValue;
    if (!annotation.read('types').isNull)
      types = _convertDartObjectMap(annotation.read('types').mapValue);
    if (!annotation.read('fragments').isNull)
      fragments =
          _convertDartObjectMapToString(annotation.read('fragments').mapValue);

    var response = await getSchema();
    List<TypeA> typesFromResponse = getTypeList(getTypesFromResponse(response));

    return GraphQLCodeGenerators().graphQLGenerate(
        typesFromResponse, namespace, types, fragments, mutationType);
  }

  _convertDartObjectMap(Map<DartObject, DartObject> dartMap) {
    Map<String, DartType> result = {};
    dartMap.keys.forEach((keys) {
      result.putIfAbsent(
          keys.toStringValue(), () => dartMap[keys].toTypeValue());
    });
    return result;
  }

  _convertDartObjectMapToString(Map<DartObject, DartObject> dartMap) {
    Map<String, String> result = {};
    dartMap.keys.forEach((keys) {
      result.putIfAbsent(
          keys.toStringValue(), () => dartMap[keys].toStringValue());
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
  List<dynamic> getTypesFromResponse(http.Response response) {
    Map<String, dynamic> json = JSON.jsonDecode(response.body);
    Map<String, dynamic> jsonData = json['data'];
    Map<String, dynamic> jsonSchema = jsonData['__schema'];
    mutationType = jsonSchema['mutationType']['name'] ??
        jsonSchema['mutationType']['name'];
    List<dynamic> types = jsonSchema["types"];
    return types;
  }
}

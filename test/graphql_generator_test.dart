import 'dart:io';

import 'package:graphql_generator/generator/code_generator.dart';
import 'package:graphql_generator/graphql_generator.dart';
import 'package:graphql_generator/generator/model.dart';
import "package:test/test.dart";

void main() {
  test('GraphQL generation', () async {
    /// Read the test response from the file.
    var response = await new File('test/test_data/turtle_backend.schema.json')
        .readAsString();

    var graphQLGenerator = GraphQLGenerators();
    var typesFromResponse = getTypeList(
        graphQLGenerator.getTypesFromResponse(stringResponse: response));
    var mutationTypeName = graphQLGenerator.getMutationTypeNameFromResponse(
        stringResponse: response);
    var namespace = "T";

    /// Generate the dart code and write it to a file.
    var resultFile = await File('test/test_data/turtle_backend.result.txt')
        .writeAsString(GraphQLCodeGenerators().generateDartCode(
            typesFromResponse, namespace, {}, {}, mutationTypeName));

    ///Read the expected result from the file as String.
    var expectedResult =
        await new File('test/test_data/turtle_backend.output.txt')
            .readAsString();

    ///Read the generated result from the file as String.
    var result = await resultFile.readAsString();

    ///Compare both the results.
    expect(expectedResult, result);
  });

  tearDown(() async {
    ///Removes the result file after test
    if (FileSystemEntity.typeSync('test/test_data/turtle_backend.result.txt') != FileSystemEntityType.notFound) {
      var resultFile = await File('test/test_data/turtle_backend.result.txt');
      resultFile.delete();
    }
  });
}

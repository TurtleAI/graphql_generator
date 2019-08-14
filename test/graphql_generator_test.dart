import 'dart:io';

import 'package:graphql_generator/generator/code_generator.dart';
import 'package:graphql_generator/graphql_generator.dart';
import 'package:graphql_generator/generator/model.dart';
import "package:test/test.dart";

void main() {

  test('GraphQL generation', () async {
    /// Read the test response from the file.
    var response = await new File('test/response.json').readAsString();

    var graphQLGenerator = GraphQLGenerators();
    var typesFromResponse = getTypeList(
        graphQLGenerator.getTypesFromResponse(stringResponse: response));
    var mutationTypeName = graphQLGenerator.getMutationTypeNameFromResponse(
        stringResponse: response);
    var namespace = "T";

    /// Generate the dart code and write it to a file.
    var resultFile = await File('test/test_generated_result.txt').writeAsString(
        GraphQLCodeGenerators().generateDartCode(
            typesFromResponse, namespace, {}, {}, mutationTypeName));

    ///Read the expected result from the file as String.
    var expectedResult =
        await new File('test/test_expected_result.txt').readAsString();

    ///Read the generated result from the file as String.
    var result = await resultFile.readAsString();

    ///Compare both the results.
    expect(expectedResult, result);
  });
}

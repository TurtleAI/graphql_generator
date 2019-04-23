import 'package:graphql_generator/annotation.dart';

@GQLGenerator(url: "https://turtle-api.herokuapp.com/graphql",
    headerToken: "Bearer Token",
    namespace: "T")
String value;
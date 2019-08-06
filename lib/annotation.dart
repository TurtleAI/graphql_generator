
import 'schema_fetcher.dart';

class GQLGenerator{
  final String url;
  final String headerToken;
  final String namespace;
  final Map<String, dynamic> types;
  final Map<String, String> fragments;
  final SchemaFetcher schemaFetcher;

  const GQLGenerator(
      {this.url, this.headerToken, this.namespace, this.types, this.fragments, this.schemaFetcher});
}
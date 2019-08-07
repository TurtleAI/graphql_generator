
class GQLGenerator{
  final String url;
  final String headerToken;
  final String namespace;
  final Map<String, dynamic> types;
  final Map<String, String> fragments;

  const GQLGenerator(
      {this.url, this.headerToken, this.namespace, this.types, this.fragments});
}
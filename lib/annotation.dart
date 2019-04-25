
class GQLGenerator{
  final String url;
  final String headerToken;
  final String namespace;
  final Map<String, Type> scalarType;

  const GQLGenerator(
      {this.url, this.headerToken, this.namespace, this.scalarType});
}
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// GraphQLGenerator
// **************************************************************************

class Query {
  Continent continents;

  Continent continent;

  Country countries;

  Country country;

  Language languages;

  Language language;
}

class Continent {
  String code;

  String name;

  Country countries;
}

class Country {
  String code;

  String name;

  String native;

  String phone;

  Continent continent;

  String currency;

  Language languages;

  String emoji;

  String emojiU;
}

class Language {
  String code;

  String name;

  String native;

  int rtl;
}

class __Schema {
  __Type types;

  __Type queryType;

  __Type mutationType;

  __Type subscriptionType;

  __Directive directives;
}

class __Type {
  __TypeKind kind;

  String name;

  String description;

  __Field fields;

  __Type interfaces;

  __Type possibleTypes;

  __EnumValue enumValues;

  __InputValue inputFields;

  __Type ofType;
}

class __Field {
  String name;

  String description;

  __InputValue args;

  __Type type;

  bool isDeprecated;

  String deprecationReason;
}

class __InputValue {
  String name;

  String description;

  __Type type;

  String defaultValue;
}

class __EnumValue {
  String name;

  String description;

  bool isDeprecated;

  String deprecationReason;
}

class __Directive {
  String name;

  String description;

  __DirectiveLocation locations;

  __InputValue args;
}

class Root {
  Query query;

  Continent continent;

  Country country;

  Language language;

  __Schema __schema;

  __Type __type;

  __TypeKind __typekind;

  __Field __field;

  __InputValue __inputvalue;

  __EnumValue __enumvalue;

  __Directive __directive;

  __DirectiveLocation __directivelocation;

  CacheControlScope cachecontrolscope;
}

enum __TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
}

enum __DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
}

enum CacheControlScope {
  PUBLIC,
  PRIVATE,
}

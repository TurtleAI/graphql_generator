// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// GraphQLGenerator
// **************************************************************************

class Query {
  List<Continent> continents;

  Continent continent;

  List<Country> countries;

  Country country;

  List<Language> languages;

  Language language;

  Query([this.continents,
    this.continent,
    this.countries,
    this.country,
    this.languages,
    this.language]);

  factory Query.fromJson(Map<String, dynamic> json) {
    return Query();
  }
}

class Continent {
  String code;

  String name;

  List<Country> countries;

  Continent([this.code, this.name, this.countries]);

  factory Continent.fromJson(Map<String, dynamic> json) {
    return Continent();
  }
}

class Country {
  String code;

  String name;

  String native;

  String phone;

  Continent continent;

  String currency;

  List<Language> languages;

  String emoji;

  String emojiU;

  Country([this.code,
    this.name,
    this.native,
    this.phone,
    this.continent,
    this.currency,
    this.languages,
    this.emoji,
    this.emojiU]);

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country();
  }
}

class Language {
  String code;

  String name;

  String native;

  int rtl;

  Language([this.code, this.name, this.native, this.rtl]);

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language();
  }
}

class __Schema {
  List<__Type> types;

  __Type queryType;

  __Type mutationType;

  __Type subscriptionType;

  List<__Directive> directives;

  __Schema([this.types,
    this.queryType,
    this.mutationType,
    this.subscriptionType,
    this.directives]);

  factory __Schema.fromJson(Map<String, dynamic> json) {
    return __Schema();
  }
}

class __Type {
  __TypeKind kind;

  String name;

  String description;

  List<__Field> fields;

  List<__Type> interfaces;

  List<__Type> possibleTypes;

  List<__EnumValue> enumValues;

  List<__InputValue> inputFields;

  __Type ofType;

  __Type([this.kind,
    this.name,
    this.description,
    this.fields,
    this.interfaces,
    this.possibleTypes,
    this.enumValues,
    this.inputFields,
    this.ofType]);

  factory __Type.fromJson(Map<String, dynamic> json) {
    return __Type();
  }
}

class __Field {
  String name;

  String description;

  List<__InputValue> args;

  __Type type;

  bool isDeprecated;

  String deprecationReason;

  __Field([this.name,
    this.description,
    this.args,
    this.type,
    this.isDeprecated,
    this.deprecationReason]);

  factory __Field.fromJson(Map<String, dynamic> json) {
    return __Field();
  }
}

class __InputValue {
  String name;

  String description;

  __Type type;

  String defaultValue;

  __InputValue([this.name, this.description, this.type, this.defaultValue]);

  factory __InputValue.fromJson(Map<String, dynamic> json) {
    return __InputValue();
  }
}

class __EnumValue {
  String name;

  String description;

  bool isDeprecated;

  String deprecationReason;

  __EnumValue(
      [this.name, this.description, this.isDeprecated, this.deprecationReason]);

  factory __EnumValue.fromJson(Map<String, dynamic> json) {
    return __EnumValue();
  }
}

class __Directive {
  String name;

  String description;

  List<__DirectiveLocation> locations;

  List<__InputValue> args;

  __Directive([this.name, this.description, this.locations, this.args]);

  factory __Directive.fromJson(Map<String, dynamic> json) {
    return __Directive();
  }
}

class Root {}

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

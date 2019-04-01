import 'dart:convert' as JSON;

class Type {
  String description;
  List<EnumValue> enumValues;
  List<Fields> fields;
  List<InputField> inputFields;
  List<Interface> interfaces;
  Kind kind;
  String name;
  List<Interface> possibleTypes;

  Type({
    this.description,
    this.enumValues,
    this.fields,
    this.inputFields,
    this.interfaces,
    this.kind,
    this.name,
    this.possibleTypes,
  });

  factory Type.fromJson(Map<String, dynamic> json) => new Type(
    // ignore: unnecessary_new, unnecessary_new, unnecessary_new
    description: json["description"] == null ? null : json["description"],
    enumValues: json["enumValues"] == null ? null : new List<EnumValue>.from(json["enumValues"].map((x) => EnumValue.fromJson(x))),
    fields: json["fields"] == null ? null : new List<Fields>.from(json["fields"].map((x) => Fields.fromJson(x))),
    inputFields: json["inputFields"] == null ? null : new List<InputField>.from(json["inputFields"].map((x) => InputField.fromJson(x))),
    interfaces: json["interfaces"] == null ? null : new List<Interface>.from(json["interfaces"].map((x) => Interface.fromJson(x))),
    kind: json["kind"] == null ? null : kindValues.map[json["kind"]],
    name: json["name"] == null ? null : json["name"],
    possibleTypes: json["possibleTypes"] == null ? null : new List<Interface>.from(json["possibleTypes"].map((x) => Interface.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "description": description == null ? null : description,
    "enumValues": enumValues == null ? null : new List<dynamic>.from(enumValues.map((x) => x.toJson())),
    "fields": fields == null ? null : new List<dynamic>.from(fields.map((x) => x.toJson())),
    "inputFields": inputFields == null ? null : new List<dynamic>.from(inputFields.map((x) => x.toJson())),
    "interfaces": interfaces == null ? null : new List<dynamic>.from(interfaces.map((x) => x.toJson())),
    "kind": kind == null ? null : kindValues.reverse[kind],
    "name": name == null ? null : name,
    "possibleTypes": possibleTypes == null ? null : new List<dynamic>.from(possibleTypes.map((x) => x.toJson())),
  };
}

class EnumValue {
  dynamic deprecationReason;
  dynamic description;
  bool isDeprecated;
  String name;

  EnumValue({
    this.deprecationReason,
    this.description,
    this.isDeprecated,
    this.name,
  });

  factory EnumValue.fromJson(Map<String, dynamic> json) => new EnumValue(
    deprecationReason: json["deprecationReason"],
    description: json["description"],
    isDeprecated: json["isDeprecated"] == null ? null : json["isDeprecated"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "deprecationReason": deprecationReason,
    "description": description,
    "isDeprecated": isDeprecated == null ? null : isDeprecated,
    "name": name == null ? null : name,
  };
}

class Fields {
  List<InputField> args;
  String deprecationReason;
  String description;
  bool isDeprecated;
  String name;
  Interface type;

  Fields({
    this.args,
    this.deprecationReason,
    this.description,
    this.isDeprecated,
    this.name,
    this.type,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => new Fields(
    args: json["args"] == null ? null : new List<InputField>.from(json["args"].map((x) => InputField.fromJson(x))),
    deprecationReason: json["deprecationReason"] == null ? null : json["deprecationReason"],
    description: json["description"] == null ? null : json["description"],
    isDeprecated: json["isDeprecated"] == null ? null : json["isDeprecated"],
    name: json["name"] == null ? null : json["name"],
    type: json["type"] == null ? null : Interface.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "args": args == null ? null : new List<dynamic>.from(args.map((x) => x.toJson())),
    "deprecationReason": deprecationReason == null ? null : deprecationReason,
    "description": description == null ? null : description,
    "isDeprecated": isDeprecated == null ? null : isDeprecated,
    "name": name == null ? null : name,
    "type": type == null ? null : type.toJson(),
  };
}

class InputField {
  String defaultValue;
  String description;
  String name;
  Interface type;

  InputField({
    this.defaultValue,
    this.description,
    this.name,
    this.type,
  });

  factory InputField.fromJson(Map<String, dynamic> json) => new InputField(
    defaultValue: json["defaultValue"] == null ? null : json["defaultValue"],
    description: json["description"] == null ? null : json["description"],
    name: json["name"] == null ? null : json["name"],
    type: json["type"] == null ? null : Interface.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "defaultValue": defaultValue == null ? null : defaultValue,
    "description": description == null ? null : description,
    "name": name == null ? null : name,
    "type": type == null ? null : type.toJson(),
  };
}

class Interface {
  Kind kind;
  String name;
  Interface ofType;

  Interface({
    this.kind,
    this.name,
    this.ofType,
  });

  factory Interface.fromJson(Map<String, dynamic> json) => new Interface(
    kind: json["kind"] == null ? null : kindValues.map[json["kind"]],
    name: json["name"] == null ? null : json["name"],
    ofType: json["ofType"] == null ? null : Interface.fromJson(json["ofType"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind == null ? null : kindValues.reverse[kind],
    "name": name == null ? null : name,
    "ofType": ofType == null ? null : ofType.toJson(),
  };
}

enum Kind { NON_NULL, SCALAR, LIST, ENUM, INPUT_OBJECT, OBJECT, INTERFACE, UNION }

final kindValues = new EnumValues({
  "ENUM": Kind.ENUM,
  "INPUT_OBJECT": Kind.INPUT_OBJECT,
  "INTERFACE": Kind.INTERFACE,
  "LIST": Kind.LIST,
  "NON_NULL": Kind.NON_NULL,
  "OBJECT": Kind.OBJECT,
  "SCALAR": Kind.SCALAR,
  "UNION": Kind.UNION
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
import 'dart:convert' as JSON;
import 'dart:io';

import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:graphql_generator/generator/enumaration.dart';
import 'package:graphql_generator/generator/input_object.dart';
import 'package:graphql_generator/generator/interface.dart';
import 'package:graphql_generator/generator/model.dart';
import 'package:graphql_generator/generator/mutation.dart';
import 'package:graphql_generator/generator/objects.dart';
import 'package:graphql_generator/generator/union.dart';
import "package:test/test.dart";

void main() {
  List<ObjectType> typesFromResponse;
  String namespace = "T";
  Map<String, DartType> types = {};
  Map<String, String> fragments = {};
  String mutationClassName;

  List<ObjectType> enumTypes = [];

  setUp(() async {
    String response = await new File('test/response.json').readAsString();
    Map<String, dynamic> json = JSON.jsonDecode(response);
    Map<String, dynamic> jsonData = json['data'];
    Map<String, dynamic> jsonSchema = jsonData['__schema'];
    mutationClassName = jsonSchema['mutationType']['name'] ??
        jsonSchema['mutationType']['name'];
    typesFromResponse = getTypeList(jsonSchema["types"]);
  });

  test('Enum generation', () {
    List<ObjectType> enumTypes =
    typesFromResponse.where((type) => type.kind == Kind.ENUM).toList();
    expect(EnumGenerator()
        .enumGenerator(enumTypes, namespace)
        .first,
        """ enum TMeetingStatus {COMPLETED ,FAILED ,IN_PROGRESS ,}""");
    expect(EnumGenerator().enumGenerator(enumTypes, namespace)[1],
        """ const TMeetingStatusValues = {"COMPLETED" : TMeetingStatus.COMPLETED,"FAILED" : TMeetingStatus.FAILED,"IN_PROGRESS" : TMeetingStatus.IN_PROGRESS,};""");
  });

  test('InterfaceType generation', () {
    List<ObjectType> interfaceTypes =
    typesFromResponse.where((type) => type.kind == Kind.INTERFACE).toList();
    Class interface = InterfaceGenerator().interfaceGenerator(
        interfaceTypes, namespace)["${namespace}TurtleEvent"];
    expect(
        DartFormatter().format('${interface.accept(DartEmitter(Allocator()))}'),
        """abstract class TTurtleEvent {
  String id;

  String requestId;

  String time;

  factory TTurtleEvent.fromJson(Map<String, dynamic> json) {
    switch (json['__typename']) {
      case "AccountTransfer":
        return TAccountTransfer.fromJson(json);
    }
    return null;
  }
}
""");
  });

  test('UnionType generation', () {
    List<ObjectType> unionTypes =
    typesFromResponse.where((type) => type.kind == Kind.UNION).toList();

    Class interface = UnionGenerator()
        .unionGenerator(unionTypes, namespace)["${namespace}AccountSource"];

    expect(
        DartFormatter().format('${interface.accept(DartEmitter(Allocator()))}'),
        """abstract class TAccountSource {
  factory TAccountSource.fromJson(Map<String, dynamic> json) {
    switch (json['__typename']) {
      case "Card":
        return TCard.fromJson(json);
      case "User":
        return TUser.fromJson(json);
    }
    return null;
  }
}
""");
  });

  test('InputObjectType generation', () {
    List<ObjectType> inputObjectType = typesFromResponse
        .where((type) => type.kind == Kind.INPUT_OBJECT)
        .toList();

    Class inputObject = InputObjectGenerator().inputObjectGenerator(
        inputObjectType, namespace, [])["${namespace}CardDueDateUnsetInput"];

    expect(
        DartFormatter()
            .format('${inputObject.accept(DartEmitter(Allocator()))}'),
        """class TCardDueDateUnsetInput {
  TCardDueDateUnsetInput({@required this.cardId});

  String cardId;

  factory TCardDueDateUnsetInput.fromJson(Map<String, dynamic> json) {
    return TCardDueDateUnsetInput(
      cardId: json['cardId'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
    };
  }
}
""");
  });

  test('ObjectType generation', () {
    List<ObjectType> inputObjectType =
    typesFromResponse.where((type) => type.kind == Kind.OBJECT).toList();

    Class inputObject = ObjectClassGenerator().objectClassGenerator(
        inputObjectType, namespace, [], [])["${namespace}HubspotDealStage"];

    expect(
        DartFormatter()
            .format('${inputObject.accept(DartEmitter(Allocator()))}'),
        """class THubspotDealStage {
  THubspotDealStage(
      {this.active,
      this.closedWon,
      this.displayOrder,
      this.id,
      this.label,
      this.probability});

  bool active;

  String closedWon;

  int displayOrder;

  String id;

  String label;

  double probability;

  factory THubspotDealStage.fromJson(Map<String, dynamic> json) {
    return THubspotDealStage(
      active: json['active'] as bool,
      closedWon: json['closedWon'] as String,
      displayOrder: json['displayOrder'] as int,
      id: json['id'] as String,
      label: json['label'] as String,
      probability: json['probability'] as double,
    );
  }
}
""");
  });

  test('Mutation generation', () {
    Map<String, Class> classes = {};
    enumTypes =
        typesFromResponse.where((type) => type.kind == Kind.ENUM).toList();
    List<ObjectType> interfaceTypes =
    typesFromResponse.where((type) => type.kind == Kind.INTERFACE).toList();
    List<ObjectType> unionTypes =
    typesFromResponse.where((type) => type.kind == Kind.UNION).toList();
    List<ObjectType> inputObjectTypes =
    typesFromResponse.where((type) => type.kind == Kind.INPUT_OBJECT).toList();
    List<ObjectType> objectTypes =
    typesFromResponse.where((type) => type.kind == Kind.OBJECT).toList();
    ObjectType mutation = typesFromResponse
        .where((type) => type.name == mutationClassName)
        .toList()
        .first;
    List<String> enumString =
    EnumGenerator().enumGenerator(enumTypes, namespace);
    Map<String, Class> interfaces =
    InterfaceGenerator().interfaceGenerator(interfaceTypes, namespace);
    Map<String, Class> unions =
    UnionGenerator().unionGenerator(unionTypes, namespace);
    Map<String, Class> inputs = InputObjectGenerator()
        .inputObjectGenerator(inputObjectTypes, namespace, enumTypes);
    Map<String, Class> objects = ObjectClassGenerator()
        .objectClassGenerator(objectTypes, namespace, enumTypes, unionTypes);

    classes.addAll(interfaces);
    classes.addAll(unions);
    classes.addAll(inputs);
    classes.addAll(objects);

    Class inputObject =
    MutationClassGenerator()
        .mutationClassGenerator(
        namespace, classes, fragments, mutation)["${namespace}Mutation"];

    expect(
        DartFormatter()
            .format('${inputObject.accept(DartEmitter(Allocator()))}'),
        """abstract class TMutation {
  Future<Map<String, dynamic>> query(
      {String document, Map<String, dynamic> variables});
  String _extractFragmentName(String fragment) {
    RegExp exp =
        new RegExp(r"\\s*fragment\\s+(\\w+)\\s+on\\s+(\\w+)", caseSensitive: true);
    return exp.firstMatch(fragment)?.group(1);
  }

  Future<String> accountOpen(String input) async {
    var result = await query(document: \"""
              mutation accountOpen(\\\$input:String!) {
                accountOpen(input:\\\$input)
              }
              
\""", variables: {"input": input});
    return result['data']['accountOpen'] as String;
  }
}
""");

  });
}

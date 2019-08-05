import 'package:analyzer/dart/element/type.dart';
import 'package:graphql_generator/generator/model.dart';

class Helper {
  static String findFieldType(Interface type, Map<String, DartType> types,
      List<ObjectType> responseTypes, String namespace) {
    if (type.name != null) {
      return _mapFieldType(type.name, types, responseTypes, namespace);
    }
    if (type.kind != null) {
      if (type.kind == Kind.LIST) {
        return "List<${findFieldType(type.ofType, types, responseTypes, namespace)}>";
      }
    }
    return findFieldType(type.ofType, types, responseTypes, namespace);
  }

  static String _mapFieldType(String name, Map<String, DartType> types,
      List<ObjectType> responseTypes, String namespace) {
    List<ObjectType> enumTypes =
        responseTypes.where((type) => type.kind == Kind.ENUM).toList();
    List<ObjectType> interfaceTypes =
        responseTypes.where((type) => type.kind == Kind.INTERFACE).toList();
    List<ObjectType> unionTypes =
        responseTypes.where((type) => type.kind == Kind.UNION).toList();
    List<ObjectType> objectTypes =
        responseTypes.where((type) => type.kind == Kind.OBJECT).toList();
    List<ObjectType> inputObjectTypes =
        responseTypes.where((type) => type.kind == Kind.INPUT_OBJECT).toList();
    if (types.containsKey(name)) {
      if (types[name].name.compareTo('Map') == 0) {
        return "Map<String,dynamic>";
      }
      if (types[name].name.compareTo('List') == 0) {
        return "List<dynamic>";
      }
      return types[name].toString();
    }

    switch (name) {
      case 'Boolean':
        return 'bool';
      case 'Int':
        return 'int';
      case 'Float':
        return 'double';
      case 'String':
        return 'String';
      default:
        if (enumTypes.any((type) => type.name == name) ||
            interfaceTypes.any((type) => type.name == name) ||
            unionTypes.any((type) => type.name == name) ||
            objectTypes.any((type) => type.name == name) ||
            inputObjectTypes.any((type) => type.name == name))
          return '${namespace}$name';
        else
          return 'String';
    }
  }

  static String response = """{
  "data": {
    "__schema": {
      "directives": [
        {
          "args": [
            {
              "defaultValue": null,
              "description": "Included when true.",
              "name": "if",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Boolean",
                  "ofType": null
                }
              }
            }
          ],
          "description": "Directs the executor to include this field or fragment only when the `if` argument is true.",
          "locations": [
            "FIELD",
            "FRAGMENT_SPREAD",
            "INLINE_FRAGMENT"
          ],
          "name": "include"
        },
        {
          "args": [
            {
              "defaultValue": null,
              "description": "Skipped when true.",
              "name": "if",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Boolean",
                  "ofType": null
                }
              }
            }
          ],
          "description": "Directs the executor to skip this field or fragment when the `if` argument is true.",
          "locations": [
            "FIELD",
            "FRAGMENT_SPREAD",
            "INLINE_FRAGMENT"
          ],
          "name": "skip"
        }
      ],
      "mutationType": {
        "name": "RootMutationType"
      },
      "queryType": {
        "name": "RootQueryType"
      },
      "types": [
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The project that has the low balance",
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "CardId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The user to send the reminder e-mail to",
              "name": "userId",
              "type": {
                "kind": "SCALAR",
                "name": "UserId",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "SendLowBalanceReminderInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "ConversationId",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "ContractId",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The id of the project",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The id of the user's to add to the project",
              "name": "memberId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardAddMemberInput",
          "possibleTypes": null
        },
        {
          "description": "The Turtle backend is modeled as an event sourcing system.\\nEvery single thing that ever happens is recorded as an event in an events table. This table is the single source of truth.\\nIf you are familiar with the redux pattern in React, this is similar except instead of actions, we have events.\\nAll other views are derived from the events table and are updated in real time.\\nThis type represents all of the domain events of the system. This is useful in showing activity feeds like in chat or transaction history.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The client-generated id of the request that lead to the creation of this domain event.\\nThis is taken from the x-request-id header for when executing commands\\nFor example, a client may send CardCreate command with x-request-id=abc123.\\nThis will result in a CardCreated event with the request_id=abc123, which makes tracing events back to the original request.\\n",
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "ISO8601 timestamp of when the event was created",
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": null,
          "kind": "INTERFACE",
          "name": "TurtleEvent",
          "possibleTypes": [
            {
              "kind": "OBJECT",
              "name": "AccountTransfer",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardAssigned",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardBudgetDecreased",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardBudgetIncreased",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardBudgetUnset",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardCompleted",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardCreated",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardDueDateSet",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardDueDateUnset",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardEstimateSet",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardEstimateUnset",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardMemberAdded",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardMemberRemoved",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardMoved",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardRenamed",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardUnassigned",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "CardUncompleted",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "FeedMessageDeleted",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "FeedMessageEdited",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "FeedMessagePosted",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "FeedSubscriptionUpdated",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "PayoutRecorded",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "ReactionAdded",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "ReactionRemoved",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "StripeChargeCreated",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "TimeEntryCreated",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "TimeEntryDeleted",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "TimeEntryEdited",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "UserReadFeedEvent",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "UserUnreadFeedEvent",
              "ofType": null
            }
          ]
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The name you want publicly displayed throughout Turtle.",
              "name": "name",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "ProfileNameSetInput",
          "possibleTypes": null
        },
        {
          "description": "A key-value pair",
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The key",
              "name": "k",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The value",
              "name": "v",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "Kv",
          "possibleTypes": null
        },
        {
          "description": "A user added a reaction to a feed event (message) in an activity feed.\\nVery similar to reactions work in popular work apps like Slack/Hipchat.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that left the reaction",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card associated with a feed (if it's a task-level card-... type feed)",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed event that the user reacted to",
              "isDeprecated": false,
              "name": "feedEventId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed that contains the feed event (message)",
              "isDeprecated": false,
              "name": "feedId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to (if it's a task-level card-... type feed)",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The string that represents the reaction such as '🐢' 'OK' or '👍'",
              "isDeprecated": false,
              "name": "reaction",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The other user in the private chat (if it's a private conversation-... feed)",
              "isDeprecated": false,
              "name": "receiverId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "ReactionAdded",
          "possibleTypes": null
        },
        {
          "description": "Represents hourly work done by a contrator.\\nWhenever they do work, the contractor logs how much time was spent, the associated task, some notes about the work.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The date the entry was logged",
              "isDeprecated": false,
              "name": "addedAt",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card (task) the work was done for.",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The contract id the time was billed under.\\nThis lets us understand the rates and conditions of the time.\\nIf a time entry is edited, the rate for the time entry's contract is used. (Not the currently active contract.)\\n",
              "isDeprecated": false,
              "name": "contractId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The date the work was done.",
              "isDeprecated": false,
              "name": "date",
              "type": {
                "kind": "SCALAR",
                "name": "Date",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Whether the time entry was deleted.\\nDeleted time entries result in transaction reversals. This means customer is refunded.\\n",
              "isDeprecated": false,
              "name": "deleted",
              "type": {
                "kind": "SCALAR",
                "name": "Boolean",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The amount of time that was worked.",
              "isDeprecated": false,
              "name": "duration",
              "type": {
                "kind": "SCALAR",
                "name": "Duration",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Whether the time entry was edited",
              "isDeprecated": false,
              "name": "edited",
              "type": {
                "kind": "SCALAR",
                "name": "Boolean",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Some notes about the work done. (Optional)",
              "isDeprecated": false,
              "name": "memo",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user who did the work",
              "isDeprecated": false,
              "name": "user",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.",
              "isDeprecated": false,
              "name": "version",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "TimeEntry",
          "possibleTypes": null
        },
        {
          "description": "Object that namespaces data related to the current user",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "All of the users reachable by the current user based on projects they've been on, users they have interacted with, etc.\\n        Usually used if you want to give the user autocomplete.",
              "isDeprecated": false,
              "name": "accessibleUsers",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "User",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "The version after which to return new events. Pass in '0' to start from the beginning",
                  "name": "afterId",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Max number of events to return at once.",
                  "name": "limit",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "Int",
                      "ofType": null
                    }
                  }
                },
                {
                  "defaultValue": null,
                  "description": "The id of the project to return events for",
                  "name": "projectIds",
                  "type": {
                    "kind": "LIST",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "CardId",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "events",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "INTERFACE",
                  "name": "TurtleEvent",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "The version after which to return new events. Pass in 0 to start from the beginning",
                  "name": "afterId",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                },
                {
                  "defaultValue": null,
                  "description": "The ids of the project to return events for",
                  "name": "projectIds",
                  "type": {
                    "kind": "LIST",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "CardId",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "eventsCount",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": "20",
                  "description": "Max number of records to return. Used for pagination.",
                  "name": "limit",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Int",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": "0",
                  "description": "Number of records to skip. Used for pagination.",
                  "name": "offset",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Int",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": "SUBSCRIBED",
                  "description": "A filter on which feeds to show by whether they were read or not",
                  "name": "show",
                  "type": {
                    "kind": "ENUM",
                    "name": "ReadStatus",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "A list of conversations private/public current user is involved in. Sorted by last activity descending.",
              "isDeprecated": false,
              "name": "feeds",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Feed",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "permissions",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "ENUM",
                  "name": "Permission",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The projects the current user is a member of",
              "isDeprecated": false,
              "name": "projects",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Project",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The number of messages unread by the current user",
              "isDeprecated": false,
              "name": "unreadCount",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The current user object",
              "isDeprecated": false,
              "name": "user",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "Me",
          "possibleTypes": null
        },
        {
          "description": "Wrapper for a string scalar",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "string",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "value",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "StringObject",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The card to set the due date of",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The due date to set it to",
              "name": "dueDate",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Date",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardDueDateSetInput",
          "possibleTypes": null
        },
        {
          "description": "The `String` scalar type represents textual data, represented as UTF-8\\ncharacter sequences. The String type is most often used by GraphQL to\\nrepresent free-form human-readable text.",
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "String",
          "possibleTypes": null
        },
        {
          "description": "A contrator tracks logs for work that they have done.\\nGenerates a transaction that deducts from customer account and adds to the your account.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that logged the time. (It's possible that this may be different from the user who did the work.)",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that logged the time. (It's possible that this may be different from the user who did the work.)",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card (task) that the use did work on.",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card (task) that the use did work on.",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The associated contract under which the work was done. Of note is the customer rate and freelancer rate.\\nIf a time entry is edited, this same contract will be used to avoid situations of a contract being edited retroactively.\\n",
              "isDeprecated": false,
              "name": "contract",
              "type": {
                "kind": "OBJECT",
                "name": "Contract",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that did the work. The generated transaction will transfer money into this users account.",
              "isDeprecated": false,
              "name": "contractor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The date the work was done. This is self-reported by the contractor.",
              "isDeprecated": false,
              "name": "entryDate",
              "type": {
                "kind": "SCALAR",
                "name": "Date",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The amount of time that was worked",
              "isDeprecated": false,
              "name": "entryDuration",
              "type": {
                "kind": "SCALAR",
                "name": "Duration",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "An optional memo where a contractor can describe what they were working on.\\nThis may not be necessary if the associated card to this time entry has enough information.\\n",
              "isDeprecated": false,
              "name": "entryMemo",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to.",
              "isDeprecated": false,
              "name": "project",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to.",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The time entry that was created.\\nNote that this is a reference to the latest time entry, so if it was edited after this event, you will see the latest properties.\\n",
              "isDeprecated": false,
              "name": "timeEntry",
              "type": {
                "kind": "OBJECT",
                "name": "TimeEntry",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The id of the time entry that was created",
              "isDeprecated": false,
              "name": "timeEntryId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "TimeEntryCreated",
          "possibleTypes": null
        },
        {
          "description": "A card was assigned to a user",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user who assigned the card",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user who assigned the card",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user the card was assigned to",
              "isDeprecated": false,
              "name": "assignee",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user the card was assigned to",
              "isDeprecated": false,
              "name": "assigneeId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card that was assigned",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card that was assigned",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardAssigned",
          "possibleTypes": null
        },
        {
          "description": "A user estimated how long a card (task) will take. For example 5-10h.\\nAlso includes situtations when a user revises their estimate.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that set the estimate. Usually done by the person doing the work, but can be done by anyone.",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that set the estimate. Usually done by the person doing the work, but can be done by anyone.",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card the estimate was set for",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card the estimate was set for",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The value the cards estimate was set to",
              "isDeprecated": false,
              "name": "estimate",
              "type": {
                "kind": "OBJECT",
                "name": "DurationRange",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardEstimateSet",
          "possibleTypes": null
        },
        {
          "description": "A user edited a time entry that they have already tracked.\\nThe editable fields of a time entry are the duration, memo, and date.\\nIf a memo and date was edited, it's just a simple edit of those attributes.\\nIf the duration was edited, this generates an adjustment transaction to account for this change.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that edited the time. (It's possible that this may be different from the user who did the work.)",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that edited the time entry. (It's possible that this may be different from the user who did the work.)",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card (task) that the use did work on.",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card (task) that the use did work on.",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The associated contract under which the work was done. Of note is the customer rate and freelancer rate.\\nIf a time entry is edited, this same contract will be used to avoid situations of a contract being edited retroactively.\\n",
              "isDeprecated": false,
              "name": "contract",
              "type": {
                "kind": "OBJECT",
                "name": "Contract",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that did the work. The generated transaction will transfer money into this users account.",
              "isDeprecated": false,
              "name": "contractor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The modified date of the time entry. Can be null if it was unmodified.",
              "isDeprecated": false,
              "name": "entryDate",
              "type": {
                "kind": "SCALAR",
                "name": "Date",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The modified duration of the time entry. Can be null if it was unmodified.",
              "isDeprecated": false,
              "name": "entryDuration",
              "type": {
                "kind": "SCALAR",
                "name": "Duration",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The modified memo of the time entry. Can be null if it was unmodified.",
              "isDeprecated": false,
              "name": "entryMemo",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The duration of the time entry before the time entry was edited.",
              "isDeprecated": false,
              "name": "prevEntryDuration",
              "type": {
                "kind": "SCALAR",
                "name": "Duration",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to.",
              "isDeprecated": false,
              "name": "project",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "A reference to the latest time entry.\\nNote that this points to the most recent one so its attributes will include all past edits.\\n",
              "isDeprecated": false,
              "name": "timeEntry",
              "type": {
                "kind": "OBJECT",
                "name": "TimeEntry",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The id of the time entry that was edited",
              "isDeprecated": false,
              "name": "timeEntryId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "TimeEntryEdited",
          "possibleTypes": null
        },
        {
          "description": "A user posted a message to an activity feed.",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that posted the message",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user posted the message",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed the message was posted to",
              "isDeprecated": false,
              "name": "feed",
              "type": {
                "kind": "OBJECT",
                "name": "Feed",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The id of the message (also known as a feed event)",
              "isDeprecated": false,
              "name": "feedEventId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed the message was posted to",
              "isDeprecated": false,
              "name": "feedId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The content of the message",
              "isDeprecated": false,
              "name": "messageBody",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the feed belongs to.\\n(Direct messages don't belong to projects so it will be null for direct messages.)\\n",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "FeedMessagePosted",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": [
            {
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "ADMIN"
            },
            {
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "CONTRACTOR"
            },
            {
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "CUSTOMER"
            },
            {
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "MANAGER"
            }
          ],
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "ENUM",
          "name": "Role",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "FeedId",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "One or more attributes of a feed was updated.\\n",
              "isDeprecated": false,
              "name": "feedSubscriptionUpdated",
              "type": {
                "kind": "OBJECT",
                "name": "FeedSubscription",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "One or more attributes of a feed was updated",
              "isDeprecated": false,
              "name": "feedUpdated",
              "type": {
                "kind": "OBJECT",
                "name": "Feed",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "The topic the meeting belongs to",
                  "name": "topic",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "A meeting is updated. This could mean any state on the meeting has changed.",
              "isDeprecated": false,
              "name": "meetingUpdated",
              "type": {
                "kind": "OBJECT",
                "name": "Meeting",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The current user's number of unread messages has changed",
              "isDeprecated": false,
              "name": "unreadCountUpdated",
              "type": {
                "kind": "OBJECT",
                "name": "Me",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "RootSubscriptionType",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The card to remove the assignee for",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardUnassignInput",
          "possibleTypes": null
        },
        {
          "description": "A user was added to a project.",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user performing the action. The one who added the user to the project.",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user performing the action. The one who added the user to the project.",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the user was added to",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": "Use projectId instead since cardId will always point to a project.",
              "description": "The id of the card",
              "isDeprecated": true,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that was added to the project",
              "isDeprecated": false,
              "name": "member",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the user was added to",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardMemberAdded",
          "possibleTypes": null
        },
        {
          "description": "An activity feed that may be associated with a number of things.\\nCurrently supports private 1-on-1 conversations and task-level conversations.\\nContains user written messages and also activity-related messages like time tracking and task completion.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": "use source instead",
              "description": null,
              "isDeprecated": true,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "Return messages that have been modified after this version for this. Useful for syncing recently modified messages for a specific feed. Pass '0' to start from the beginning.",
                  "name": "afterVersion",
                  "type": {
                    "kind": "SCALAR",
                    "name": "String",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "The id to return records before.\\n          This may be used in some sort of load-more functionality. You pass the id of the last event loaded, and records before that id are loaded",
                  "name": "before",
                  "type": {
                    "kind": "SCALAR",
                    "name": "String",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": "20",
                  "description": "Number of total records to return",
                  "name": "limit",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Int",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "List of feed events that belong to the activity feed. Sorted by time created ascending.",
              "isDeprecated": false,
              "name": "feedEvents",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "FeedEvent",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "The user id to pull the feed subscription up for. Defaults to the current user.",
                  "name": "userId",
                  "type": {
                    "kind": "SCALAR",
                    "name": "UserId",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "The current user's subscription of this activity feed.",
              "isDeprecated": false,
              "name": "feedSubscription",
              "type": {
                "kind": "OBJECT",
                "name": "FeedSubscription",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Unique identifier for an activity feed.\\n    Generated based on what it is attached to like conversation-123-987, card-556, or meeting-abc",
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The most recent event/message in the activity feed",
              "isDeprecated": false,
              "name": "lastFeedEvent",
              "type": {
                "kind": "OBJECT",
                "name": "FeedEvent",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": "use source instead",
              "description": null,
              "isDeprecated": true,
              "name": "otherUser",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "If the feed is attached to a task, this is the project the task belongs to.\\n      Useful if you want to show which project a message belong to.",
              "isDeprecated": false,
              "name": "project",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The entity the activity feed is attached to.\\n        It's either the other user in the conversation if it's a private message.\\n        Or it's the card it's attached to.",
              "isDeprecated": false,
              "name": "source",
              "type": {
                "kind": "UNION",
                "name": "FeedSource",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.",
              "isDeprecated": false,
              "name": "version",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "Feed",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "TimeEntryId",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The card the link to delete is coming from",
              "name": "fromId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The type of the link to be deleted",
              "name": "linkType",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The card the link to delete is going to",
              "name": "toId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardLinkDeleteInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The feed event remove the reaction from",
              "name": "feedEventId",
              "type": {
                "kind": "SCALAR",
                "name": "FeedEventId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The reaction to remove. Should be an emoji like 👍",
              "name": "reaction",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "RemoveReactionInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The card to remove the estimate for",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardEstimateUnsetInput",
          "possibleTypes": null
        },
        {
          "description": "An entry representing how many hours/week a contractor wants to work.\\nThis can be used to compare their desired workload with actual workload from time entries.\\nTo simplify things, start and end dates currently must line up on a US calendar.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that logged the entry.  Might be a manager or the user self-reporting.",
              "isDeprecated": false,
              "name": "author",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user id that logged the entry. Might be a manager or the user self-reporting.",
              "isDeprecated": false,
              "name": "authorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "End of the time period (inclusive). Currently must be a Saturday, US end of the week.",
              "isDeprecated": false,
              "name": "endDate",
              "type": {
                "kind": "SCALAR",
                "name": "Date",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project in question.\\nContractors can report the total amount of time they'd like to work. (This field will be empty)\\nOr contractors can report how much they would like to work specific to a project. (This field will refer to the project)\\n",
              "isDeprecated": false,
              "name": "project",
              "type": {
                "kind": "OBJECT",
                "name": "Project",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project id in question.\\nContractors can report the total amount of time they'd like to work. (This field will be empty)\\nOr contractors can report how much they would like to work specific to a project. (This field will refer to the project)\\n",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Start of the time period (inclusive). Currently must be a Sunday, US start of the week.",
              "isDeprecated": false,
              "name": "startDate",
              "type": {
                "kind": "SCALAR",
                "name": "Date",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The amount of time during the startDate - endDate (inclusive) that the contractor wants to work",
              "isDeprecated": false,
              "name": "timePerWeek",
              "type": {
                "kind": "SCALAR",
                "name": "Duration",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The last time the entry was updated. If it was never edited, this is equal to the time of creation.",
              "isDeprecated": false,
              "name": "updatedAt",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The contractor doing the work.",
              "isDeprecated": false,
              "name": "user",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The contractor id doing the work ",
              "isDeprecated": false,
              "name": "userId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "AvailabilityEntry",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The sibling card to place the new card after.",
              "name": "afterId",
              "type": {
                "kind": "SCALAR",
                "name": "CardId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The user to assign the task to.",
              "name": "assigneeId",
              "type": {
                "kind": "SCALAR",
                "name": "UserId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The sibling card to place the new card before.",
              "name": "beforeId",
              "type": {
                "kind": "SCALAR",
                "name": "CardId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The id of the card. This is server-generated so pass in 'new' as the paramter.",
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "NewId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The name to give the card. This is what will show up in task lists.\\n",
              "name": "cardName",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "General purpose meta data for keeping track of anything you desire. For example, the source of the task.",
              "name": "meta",
              "type": {
                "kind": "SCALAR",
                "name": "Json",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The parent id of the card to place the card under. Omit if you are creating a project.",
              "name": "parentId",
              "type": {
                "kind": "SCALAR",
                "name": "CardId",
                "ofType": null
              }
            },
            {
              "defaultValue": "false",
              "description": null,
              "name": "quickAdd",
              "type": {
                "kind": "SCALAR",
                "name": "Boolean",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardCreateInput",
          "possibleTypes": null
        },
        {
          "description": "The `Int` scalar type represents non-fractional signed whole numeric values.\\nInt can represent values between `-(2^53 - 1)` and `2^53 - 1` since it is\\nrepresented in JSON as double-precision floating point numbers specified\\nby [IEEE 754](http://en.wikipedia.org/wiki/IEEE_floating_point).",
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "Int",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The time entry to delete",
              "name": "entryId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "TimeEntryId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "TimeEntryDeleteInput",
          "possibleTypes": null
        },
        {
          "description": "The subscription status between a user and an activity feed was updated.\\nThis could mean they got subscribed, unsubscribed, or muted.\\n(A user sees all subscribed feeds in their conversation list.)\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that the subscription belongs to",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed that the subscription status changed for",
              "isDeprecated": false,
              "name": "feedId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the feed belongs to (if any)",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The new subscription status of the feed",
              "isDeprecated": false,
              "name": "subscriptionType",
              "type": {
                "kind": "ENUM",
                "name": "FeedSubscriptionStatus",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "FeedSubscriptionUpdated",
          "possibleTypes": null
        },
        {
          "description": "A card was move from one parent to another",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user who moved the card",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user who moved the card",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card that was moved",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card that was moved",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card was moved within. Currently cards can only be moved within a project.",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The new parent the card was moved under",
              "isDeprecated": false,
              "name": "to",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The new parent the card was moved under",
              "isDeprecated": false,
              "name": "toId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardMoved",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The duration of work to increase the budget by.\\nBudgets may support money in the future but currently only duration is supported.\\n",
              "name": "budgetDuration",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Duration",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The card to increase the budget for",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardBudgetIncreaseInput",
          "possibleTypes": null
        },
        {
          "description": "The `Boolean` scalar type represents `true` or `false`.",
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "Boolean",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The feed you want to mark as read. (Unread feed events in this feed will be marked as read.)",
              "name": "feedId",
              "type": {
                "kind": "SCALAR",
                "name": "FeedId",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "FeedMarkAsReadInput",
          "possibleTypes": null
        },
        {
          "description": "Money was transferred between two accounts",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that performed the action",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that performed the action",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The amount of money transferred",
              "isDeprecated": false,
              "name": "amount",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The account the money was deposited to",
              "isDeprecated": false,
              "name": "destAccountId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "An optional memo the preson doing the transfer can write in",
              "isDeprecated": false,
              "name": "memo",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The account the money was withdrawn from",
              "isDeprecated": false,
              "name": "sourceAccountId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "AccountTransfer",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The amount of money to transfer",
              "name": "amount",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Usd",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The account to put money in",
              "name": "destAccount",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "AccountId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "Some notes about the transaction. A customer may see this in their transactions screen.",
              "name": "memo",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The account to take money from",
              "name": "sourceAccount",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "AccountId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "AccountTransferInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The duration of work to increase the budget by.\\nBudgets may support money in the future but currently only duration is supported.\\n",
              "name": "budgetDuration",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Duration",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The card to increase the budget for",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardBudgetDecreaseInput",
          "possibleTypes": null
        },
        {
          "description": "A single instance of a video conference meeting. Has a start time, end time, participants and so on.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The time the meeting took. Does not have a value until the meeting has ended.",
              "isDeprecated": false,
              "name": "duration",
              "type": {
                "kind": "SCALAR",
                "name": "Duration",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The time the meeting ended.\\nSame as when the last parcipant left. When a room has been empty for 5 minutes, it is considered ended.\\n",
              "isDeprecated": false,
              "name": "endedAt",
              "type": {
                "kind": "SCALAR",
                "name": "DateTime",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": "ALL",
                  "description": "Filter to a subset of participants",
                  "name": "filter",
                  "type": {
                    "kind": "ENUM",
                    "name": "MeetingParticipantFilter",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "The users currently in the meeting.",
              "isDeprecated": false,
              "name": "participants",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "User",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The video recording of the meeting.\\nOnly applies to meetings that have happened in the past with recording enabled.\\n",
              "isDeprecated": false,
              "name": "recording",
              "type": {
                "kind": "OBJECT",
                "name": "MeetingRecording",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The room the meeting belongs to. For example project:27637534222268650867953431281664\\nA room may only have one meeting going on at a time and all meetings belong to a room.\\n",
              "isDeprecated": false,
              "name": "roomId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The time the meeting started.\\nSame as when the first parcipant joined.\\n",
              "isDeprecated": false,
              "name": "startedAt",
              "type": {
                "kind": "SCALAR",
                "name": "DateTime",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "status",
              "type": {
                "kind": "ENUM",
                "name": "MeetingStatus",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "Meeting",
          "possibleTypes": null
        },
        {
          "description": "A completed card was marked as incomplete",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that marked the card as incomplete",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that marked the card as incomplete",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card that was marked incomplete",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card that was marked incomplete",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardUncompleted",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The feed to post the message to",
              "name": "feedId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "FeedId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The contents of the message.\\n\\nMessage format:\\nJust plain text\\nUser mentions in the format <user:27156949188089024041474864119808>\\nCard references in the format <card:27156949188089024041474864119808>\\nFiles in the format <file.s3:2309j_f23fdf2fdf>\\n",
              "name": "messageBody",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "FeedPostMessageInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "CardId",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "Identifier for the account. Must be of the form like turtle:idofacct or external:idofacct",
              "name": "accountId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "AccountOpenInput",
          "possibleTypes": null
        },
        {
          "description": "The entity that an account is associated with",
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "UNION",
          "name": "AccountSource",
          "possibleTypes": [
            {
              "kind": "OBJECT",
              "name": "Card",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "User",
              "ofType": null
            }
          ]
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "id",
                  "type": {
                    "kind": "SCALAR",
                    "name": "AccountId",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Fetch an account by its id",
              "isDeprecated": false,
              "name": "account",
              "type": {
                "kind": "OBJECT",
                "name": "Account",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "type",
                  "type": {
                    "kind": "LIST",
                    "name": null,
                    "ofType": {
                      "kind": "ENUM",
                      "name": "AccountType",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "accounts",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Account",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "activeProjects",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Project",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "apiVersion",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "endDate",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "projectId",
                  "type": {
                    "kind": "SCALAR",
                    "name": "CardId",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "startDate",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "userId",
                  "type": {
                    "kind": "SCALAR",
                    "name": "UserId",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "availabilityEntries",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "AvailabilityEntry",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "id",
                  "type": {
                    "kind": "SCALAR",
                    "name": "CardId",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Fetch a card by its id",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "Return cards that have been modified after this version. Useful for syncing recently modified cards. Pass '0' to start from the beginning.",
                  "name": "afterVersion",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Max number of events to return at once.",
                  "name": "limit",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Int",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "All cards current user has access to.\\n",
              "isDeprecated": false,
              "name": "cards",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Card",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "Return cards that have been modified after this version. Useful for syncing recently modified cards. Pass '0' to start from the beginning.",
                  "name": "afterVersion",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "All cards current user has access to.\\n",
              "isDeprecated": false,
              "name": "cardsCount",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "inputs",
                  "type": {
                    "kind": "LIST",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "Kv",
                      "ofType": null
                    }
                  }
                },
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "type",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "command",
              "type": {
                "kind": "OBJECT",
                "name": "Command",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "The conversation id.\\n",
                  "name": "id",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "conversation",
              "type": {
                "kind": "OBJECT",
                "name": "Conversation",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "id",
                  "type": {
                    "kind": "SCALAR",
                    "name": "FeedId",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Fetch a feed by its id",
              "isDeprecated": false,
              "name": "feed",
              "type": {
                "kind": "OBJECT",
                "name": "Feed",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "id",
                  "type": {
                    "kind": "SCALAR",
                    "name": "FeedEventId",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Fetch a feed event by id",
              "isDeprecated": false,
              "name": "feedEvent",
              "type": {
                "kind": "OBJECT",
                "name": "FeedEvent",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "Return feed events that have been modified after this version. Useful for syncing recently modified feed events. Pass '0' to start from the beginning.",
                  "name": "afterVersion",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Max number of items to return at once.",
                  "name": "limit",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "Int",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "All feed events the current user has access to.\\n",
              "isDeprecated": false,
              "name": "feedEvents",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "FeedEvent",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "Return feed events that have been modified after this version. Useful for syncing recently modified feed events. Pass '0' to start from the beginning.",
                  "name": "afterVersion",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "All feed events the current user has access to.\\n",
              "isDeprecated": false,
              "name": "feedEventsCount",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "Return feed subscriptions that have been modified after this version. Useful for syncing recently modified feed subscriptions. Pass '0' to start from the beginning.",
                  "name": "afterVersion",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Max number of items to return at once.",
                  "name": "limit",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "Int",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Feed subscriptions for the current user.\\n",
              "isDeprecated": false,
              "name": "feedSubscriptions",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "FeedSubscription",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "Return feed subscriptions that have been modified after this version. Useful for syncing recently modified feed subscriptions. Pass '0' to start from the beginning.",
                  "name": "afterVersion",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Feed subscriptions for the current user.\\n",
              "isDeprecated": false,
              "name": "feedSubscriptionsCount",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "Return feeds that have been modified after this version. Useful for syncing recently modified feeds. Pass '0' to start from the beginning.",
                  "name": "afterVersion",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Max number of items to return at once.",
                  "name": "limit",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "Int",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "All feeds the current user has access to.\\n",
              "isDeprecated": false,
              "name": "feeds",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Feed",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "Return feeds that have been modified after this version. Useful for syncing recently modified feeds. Pass '0' to start from the beginning.",
                  "name": "afterVersion",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "All feeds the current user has access to.\\n",
              "isDeprecated": false,
              "name": "feedsCount",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "id",
                  "type": {
                    "kind": "SCALAR",
                    "name": "ID",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "hubspotPipeline",
              "type": {
                "kind": "OBJECT",
                "name": "HubspotPipeline",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "me",
              "type": {
                "kind": "OBJECT",
                "name": "Me",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "id",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "ID",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Fetch a meeting by its id",
              "isDeprecated": false,
              "name": "meeting",
              "type": {
                "kind": "OBJECT",
                "name": "Meeting",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "The project to fetch the meetings for",
                  "name": "projectId",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "CardId",
                      "ofType": null
                    }
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to meetings that have this status",
                  "name": "status",
                  "type": {
                    "kind": "ENUM",
                    "name": "MeetingStatus",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Fetch the meetings for a given project",
              "isDeprecated": false,
              "name": "meetings",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Meeting",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "endDate",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "Date",
                      "ofType": null
                    }
                  }
                },
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "startDate",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "Date",
                      "ofType": null
                    }
                  }
                },
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "userId",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "UserId",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "notificationDeliveries",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "NotificationDelivery",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "id",
                  "type": {
                    "kind": "SCALAR",
                    "name": "CardId",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "project",
              "type": {
                "kind": "OBJECT",
                "name": "Project",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "The id to return records before.\\n          This may be used in some sort of load-more functionality. You pass the id of the last event loaded, and records before that id are loaded",
                  "name": "before",
                  "type": {
                    "kind": "SCALAR",
                    "name": "String",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Max number of items to return at once.",
                  "name": "limit",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "Int",
                      "ofType": null
                    }
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Return feed events that only belong to this project.",
                  "name": "projectId",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "CardId",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "All feed events that belong to a project\\n",
              "isDeprecated": false,
              "name": "projectFeedEvents",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "FeedEvent",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "tags",
                  "type": {
                    "kind": "LIST",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "String",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "projects",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Project",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "Return time entries that have been modified after this version. Useful for syncing recently modified time entries. Pass '0' to start from the beginning.",
                  "name": "afterVersion",
                  "type": {
                    "kind": "SCALAR",
                    "name": "String",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries before this start date. (Inclusive)",
                  "name": "endDate",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Max number of items to return at once.",
                  "name": "limit",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Int",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries that are for a specific project.",
                  "name": "projectId",
                  "type": {
                    "kind": "SCALAR",
                    "name": "CardId",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries after this start date. (Inclusive)",
                  "name": "startDate",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "The user to filter time entries by. Pass in 'me' to default to the current user.",
                  "name": "userId",
                  "type": {
                    "kind": "SCALAR",
                    "name": "UserId",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries before the date of work. (Inclusive)",
                  "name": "workDoneEnd",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries after the date of work. (Inclusive)",
                  "name": "workDoneStart",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Time entries for a given user. Defaults to current user.\\n",
              "isDeprecated": false,
              "name": "timeEntries",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "TimeEntry",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "Return time entries that have been modified after this version. Useful for syncing recently modified time entries. Pass '0' to start from the beginning.",
                  "name": "afterVersion",
                  "type": {
                    "kind": "SCALAR",
                    "name": "String",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries before this start date. (Inclusive)",
                  "name": "endDate",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries that are for a specific project.",
                  "name": "projectId",
                  "type": {
                    "kind": "SCALAR",
                    "name": "CardId",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries after this start date. (Inclusive)",
                  "name": "startDate",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "The user to filter time entries by. Pass in 'me' to default to the current user.",
                  "name": "userId",
                  "type": {
                    "kind": "SCALAR",
                    "name": "UserId",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries before the date of work. (Inclusive)",
                  "name": "workDoneEnd",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries after the date of work. (Inclusive)",
                  "name": "workDoneStart",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Time entries for a given user. Defaults to current user.\\n",
              "isDeprecated": false,
              "name": "timeEntriesCount",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "id",
                  "type": {
                    "kind": "SCALAR",
                    "name": "TimeEntryId",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Fetch a time entry by its id",
              "isDeprecated": false,
              "name": "timeEntry",
              "type": {
                "kind": "OBJECT",
                "name": "TimeEntry",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "id",
                  "type": {
                    "kind": "SCALAR",
                    "name": "UserId",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Fetch a user by id",
              "isDeprecated": false,
              "name": "user",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "role",
                  "type": {
                    "kind": "ENUM",
                    "name": "Role",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "users",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "User",
                  "ofType": null
                }
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "RootQueryType",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "THe list of tags to give a user. For example react, ios, android, ml.\\nThis overwrites teh entire list. So if you want to add a skill, you must pass in the full list with the new tags added.\\n",
              "name": "skills",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The user to set the skill tags for",
              "name": "userId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "UserId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "UserSetSkillsInput",
          "possibleTypes": null
        },
        {
          "description": "A card had its budget decreased.\\nEvery card can have a budget. This is used so a customer can budget a feature.\\nFor example, a customer could limit the cost of a feature to 100h.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that increased the budget",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that increased the budget",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The amount the card's budget was decreased by",
              "isDeprecated": false,
              "name": "budget",
              "type": {
                "kind": "OBJECT",
                "name": "CardBudget",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card which had its budget decreased",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card which had its budget decreased",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardBudgetDecreased",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "coreSkills",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "githubUsername",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "hourlyRate",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "recruitingStage",
              "type": {
                "kind": "OBJECT",
                "name": "HubspotDealStage",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "HubspotContact",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The conversation id.\\nThis is server-generated so pass in 'new' as the paramter.\\n",
              "name": "conversationId",
              "type": {
                "kind": "SCALAR",
                "name": "NewId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The conversation topic.\\n",
              "name": "topic",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CreateConversationInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that cleared the due date",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that cleared the due date",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card the due date was cleared for.\\nNote that this is the latest reference to the card. It's not a snapshot of the card at the time of this event.\\n",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card the due date was cleared for",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardDueDateUnset",
          "possibleTypes": null
        },
        {
          "description": "A user removed their reaction from a feed event (message) in an activity feed\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that removed the reaction",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card associated with a feed (if it's a task-level card-... type feed)",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed event that the user removed the reaction from",
              "isDeprecated": false,
              "name": "feedEventId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed that contains the feed event (message)",
              "isDeprecated": false,
              "name": "feedId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to (if it's a task-level card-... type feed)",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The string that represents the reaction such as '🐢' 'OK' or '👍'",
              "isDeprecated": false,
              "name": "reaction",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The other user in the private chat (if it's a private conversation-... feed)",
              "isDeprecated": false,
              "name": "receiverId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "ReactionRemoved",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The timezone you are currently in",
              "name": "timezone",
              "type": {
                "kind": "SCALAR",
                "name": "Timezone",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "ProfileTimezoneSetInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The amount of money to add to the project account",
              "name": "amount",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Usd",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The token from the client that represents the credit card details.\\nEither cardToken or creditCardId must be provided.\\n",
              "name": "cardToken",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The id of an existing credit card on file to charge.\\nCredit card must belong to you for security purposes unless you are a manager or admin.\\nEither cardToken or creditCardId must be provided.\\n",
              "name": "creditCardId",
              "type": {
                "kind": "SCALAR",
                "name": "CreditCardId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The project to refill",
              "name": "projectId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "ProjectAddBalanceWithStripeInput",
          "possibleTypes": null
        },
        {
          "description": "A duration output in seconds. Accepts inputs values flexibly like '1h', '1.5 hours', '2h30min'",
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "Duration",
          "possibleTypes": null
        },
        {
          "description": "A bank-account-like entity that is used for keeping track of balances for projects, contractors, and turtle itself.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The current balance of the account. Kind of like a Venmo/PayPal balance. It's the sum of all ledger in the account.",
              "isDeprecated": false,
              "name": "balance",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "date",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "Date",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "balancePending",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "date",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "Date",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "balanceSettled",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "Filter to return entries before this date (including the end date date)",
                  "name": "endDate",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Limit to this many entries",
                  "name": "limit",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Int",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to return entries after this date (including the start date)",
                  "name": "startDate",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "List of transaction entries for this account.",
              "isDeprecated": false,
              "name": "entries",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "AccountEntry",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "A unique identifier for the account of the form type:id\\nFor example turtle:management external:customer_deposits user:27981359507659557423658059497472, project:27157007491395523176927665389568\\nFor user and project accounts, it the second part is the identifier (user or project id) the account refers to.\\n",
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The entity this account is associated with. Currently only applies to users or projects.",
              "isDeprecated": false,
              "name": "source",
              "type": {
                "kind": "UNION",
                "name": "AccountSource",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "type",
              "type": {
                "kind": "ENUM",
                "name": "AccountType",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "Account",
          "possibleTypes": null
        },
        {
          "description": "Represents the budget for a card. Currently only supports a time-based (not money-based) budget.",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The max number of hours allocated",
              "isDeprecated": false,
              "name": "duration",
              "type": {
                "kind": "SCALAR",
                "name": "Duration",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "CardBudget",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The deleted card to restore",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardUndeleteInput",
          "possibleTypes": null
        },
        {
          "description": "The `DateTime` scalar type represents a date and time in the UTC\\ntimezone. The DateTime appears in a JSON response as an ISO8601 formatted\\nstring, including UTC timezone ('Z'). The parsed date and time string will\\nbe converted to UTC and any UTC offset other than 0 will be rejected.",
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "DateTime",
          "possibleTypes": null
        },
        {
          "description": "A credit card that customers pay with. Currently all credit cards are from Stripe.",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The brand of credit card. For ex: MasterCard, American Express, Visa",
              "isDeprecated": false,
              "name": "brand",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Month the credit card expires (number from 1-12)",
              "isDeprecated": false,
              "name": "expMonth",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Year the credit card expires",
              "isDeprecated": false,
              "name": "expYear",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The unique identifier of the credit card. This will match whatever is on the Stripe account.",
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Last 4 digits of a credit card",
              "isDeprecated": false,
              "name": "last4",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user who owns the credit card. Meaning the user who entered the credit card into the system.",
              "isDeprecated": false,
              "name": "owner",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "CreditCard",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The project to remove the user from",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The user to remove from the project",
              "name": "memberId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "UserId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardRemoveMemberInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The id of the project/task to delete",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardDeleteInput",
          "possibleTypes": null
        },
        {
          "description": "US dollars like \$10.50",
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "Usd",
          "possibleTypes": null
        },
        {
          "description": "A user deleted a time entry that they have already tracked.\\nThe editable fields of a time entry are the duration, memo, and date.\\nThis generates an adjustment for the contractor to refund Turtle and Turtle to refund the customer.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that deleted the time entry. (It's possible that this may be different from the user who did the work.)",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that deleted the time entry. (It's possible that this may be different from the user who did the work.)",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card (task) that the use did work on.",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card (task) that the use did work on.",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The associated contract under which the work was done. Of note is the customer rate and freelancer rate.\\nIf a time entry is deleted, this same contract will be used to avoid edge cases.\\n",
              "isDeprecated": false,
              "name": "contract",
              "type": {
                "kind": "OBJECT",
                "name": "Contract",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that did the work. The generated transaction will transfer money into this users account.",
              "isDeprecated": false,
              "name": "contractor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The duration (time worked) of the time entry before it was deleted",
              "isDeprecated": false,
              "name": "prevEntryDuration",
              "type": {
                "kind": "SCALAR",
                "name": "Duration",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to.",
              "isDeprecated": false,
              "name": "project",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to.",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "A reference to the latest time entry.\\nNote that this points to the most recent one so its attributes will include all past edits.\\n",
              "isDeprecated": false,
              "name": "timeEntry",
              "type": {
                "kind": "OBJECT",
                "name": "TimeEntry",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The id of the time entry that was edited",
              "isDeprecated": false,
              "name": "timeEntryId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "TimeEntryDeleted",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The contract to end.\\nA user can have a max of one contract per project.\\n",
              "name": "contractId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "ContractId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "ContractEndInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The feed event to edit the message body for",
              "name": "feedEventId",
              "type": {
                "kind": "SCALAR",
                "name": "FeedEventId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The new message body\\n\\nMessage format: see [FeedPostMessage] mutation.\\n",
              "name": "messageBody",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "FeedEditMessageInput",
          "possibleTypes": null
        },
        {
          "description": "The name property of a card was changed",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user who renamed the card",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user who renamed the card",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card that was renamed",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card that was renamed",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The new name the card was renamed to",
              "isDeprecated": false,
              "name": "cardName",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project of the card that was renamed",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardRenamed",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The card to set the tags for",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The tag group (namespae) of tags. Currently only 'project_status' is supported.\\nOnce we introduce tagging on the client-app or add other management features, other tags may be added.\\n",
              "name": "tagGroup",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The tags to set",
              "name": "tags",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardTagsSetInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The emoji of the reaction like '🐢'",
              "isDeprecated": false,
              "name": "emoji",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": "Internal use",
              "description": null,
              "isDeprecated": true,
              "name": "reaction",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The id of the user that added the reaction",
              "isDeprecated": false,
              "name": "userId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "Reaction",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The message's content.\\n",
              "name": "content",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The conversation id.\\n",
              "name": "conversationId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "ConversationId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The message id.\\nThis is server-generated so pass in 'new' as the paramter.\\n",
              "name": "messageId",
              "type": {
                "kind": "SCALAR",
                "name": "NewId",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "SendMessageToConversationInput",
          "possibleTypes": null
        },
        {
          "description": "A card's assignee was removed",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that removed the assignee",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that removed the assignee",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card that the assignee was removed for",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card that the assignee was removed for",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardUnassigned",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The message's content.\\n",
              "isDeprecated": false,
              "name": "content",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The conversation information.\\n",
              "isDeprecated": false,
              "name": "conversation",
              "type": {
                "kind": "OBJECT",
                "name": "Conversation",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The conversation id.\\n",
              "isDeprecated": false,
              "name": "conversationId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The date and time of when the message was sent.\\n",
              "isDeprecated": false,
              "name": "createdAt",
              "type": {
                "kind": "SCALAR",
                "name": "DateTime",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The message id.\\n",
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user information.\\n",
              "isDeprecated": false,
              "name": "user",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user id.\\n",
              "isDeprecated": false,
              "name": "userId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "ChatMessage",
          "possibleTypes": null
        },
        {
          "description": "In chat messages, the body of messages is represented as an array of tokens.\\nThese 'rich' tokens can be of differnet types like strings, dates, files, users, and so on.\\nOn the client, one can render the body of a message by mapping over the tokens and rendering an array of components.\\n",
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "UNION",
          "name": "DocumentToken",
          "possibleTypes": [
            {
              "kind": "OBJECT",
              "name": "Card",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "DateObject",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "DurationRange",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "File",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "Link",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "StringObject",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "TimeEntry",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "User",
              "ofType": null
            }
          ]
        },
        {
          "description": "The `ID` scalar type represents a unique identifier, often used to\\nrefetch an object or as key for a cache. The ID type appears in a JSON\\nresponse as a String; however, it is not intended to be human-readable.\\nWhen expected as an input type, any string (such as `'4'`) or integer\\n(such as `4`) input value will be accepted as an ID.",
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "ID",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "A CDN link to the video file for downloading/playing the video.",
              "isDeprecated": false,
              "name": "downloadUrl",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The duration of the video recording.",
              "isDeprecated": false,
              "name": "duration",
              "type": {
                "kind": "SCALAR",
                "name": "Duration",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The file size in bytes.",
              "isDeprecated": false,
              "name": "fileSize",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The file format of the video. For example mp4",
              "isDeprecated": false,
              "name": "format",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The resolution of the video. For example 640x480",
              "isDeprecated": false,
              "name": "resolution",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The status of this recording. For example if the recording is ready or still processing.",
              "isDeprecated": false,
              "name": "status",
              "type": {
                "kind": "ENUM",
                "name": "MeetingRecordingStatus",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "MeetingRecording",
          "possibleTypes": null
        },
        {
          "description": "A user was charged on their credit card.\\nGenerates a transaction.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that charged the credit card.\\nCurrently only used when a customer refills their balance using a credit card\\nMay not necessarily be the owner of the credit card. Could be a manager.\\n",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The credit card that was charged",
              "isDeprecated": false,
              "name": "creditCard",
              "type": {
                "kind": "OBJECT",
                "name": "CreditCard",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": "use creditCard instead",
              "description": null,
              "isDeprecated": true,
              "name": "last4",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the charge was associated wtih.",
              "isDeprecated": false,
              "name": "project",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "StripeChargeCreated",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "Email",
          "possibleTypes": null
        },
        {
          "description": "A directional link between two cards in Turtle. Kind of like a hyperlink.\\nUsed for things like tying an internal management project to a customer project.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card the link is coming from",
              "isDeprecated": false,
              "name": "from",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card the link is going to",
              "isDeprecated": false,
              "name": "to",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The type of link. For example management or turtle_support.",
              "isDeprecated": false,
              "name": "type",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "CardLink",
          "possibleTypes": null
        },
        {
          "description": "The `Date` scalar type represents a date. The Date appears in a JSON\\nresponse as an ISO8601 formatted string.",
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "Date",
          "possibleTypes": null
        },
        {
          "description": "A card had its budget removed.\\nUsually means that a customer decided they didn't want a budget for a card.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that removed the cards budget",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that removed the cards budget",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card which had its budget removed",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card which had its budget removed",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardBudgetUnset",
          "possibleTypes": null
        },
        {
          "description": "A user marked a card as completed.",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that marked the card as completed",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that marked the card as completed",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card that was completed",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card that was completed",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardCompleted",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "amount",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "currency",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "Money",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The card to mark as complete",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardCompleteInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The date and time of when the conversation was created.\\n",
              "isDeprecated": false,
              "name": "createdAt",
              "type": {
                "kind": "SCALAR",
                "name": "DateTime",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The conversation id.\\n",
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "List of conversation's messages.\\n",
              "isDeprecated": false,
              "name": "messages",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "ChatMessage",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "List of conversation's participants.\\n",
              "isDeprecated": false,
              "name": "participants",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Participant",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The conversation subject.\\n",
              "isDeprecated": false,
              "name": "topic",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The date and time of when the conversation was last updated.\\n",
              "isDeprecated": false,
              "name": "updatedAt",
              "type": {
                "kind": "SCALAR",
                "name": "DateTime",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "Conversation",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": [
            {
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "EMAIL"
            },
            {
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "PUSH"
            }
          ],
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "ENUM",
          "name": "NotificationDeliveryType",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that set the due date",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that set the due date",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card the due date was set for.\\nNote that this is the latest reference to the card. It's not a snapshot of the card at the time of this event.\\n",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card the due date was set for",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The value the due date was set to.",
              "isDeprecated": false,
              "name": "dueDate",
              "type": {
                "kind": "SCALAR",
                "name": "Date",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project of the card",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardDueDateSet",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": [
            {
              "deprecationReason": null,
              "description": "Show all participants including past particpants that have already left",
              "isDeprecated": false,
              "name": "ALL"
            },
            {
              "deprecationReason": null,
              "description": "Show participants that are only currently in the meeting",
              "isDeprecated": false,
              "name": "CONNECTED"
            }
          ],
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "ENUM",
          "name": "MeetingParticipantFilter",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "active",
              "type": {
                "kind": "SCALAR",
                "name": "Boolean",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "closedWon",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "displayOrder",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "label",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "probability",
              "type": {
                "kind": "SCALAR",
                "name": "Float",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "HubspotDealStage",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The card to mark as incomplete",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardUncompleteInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The date the work was done (if modified)",
              "name": "entryDate",
              "type": {
                "kind": "SCALAR",
                "name": "Date",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The amount of work done (if modified)",
              "name": "entryDuration",
              "type": {
                "kind": "SCALAR",
                "name": "Duration",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The time entry to modify",
              "name": "entryId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "TimeEntryId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "Details about the work done (if modified)",
              "name": "entryMemo",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "TimeEntryEditInput",
          "possibleTypes": null
        },
        {
          "description": "When new events are generated, a notification service decides which users should be notified of the event.\\nThis could include events like users posting messages, tasks getting completed, and so on.\\nWhen a user should be notified of an event, this event is generated.\\nThis, in combination with [UserReadFeedEvent], can be used to generate unread counts per feed.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that should be notified of this event",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The event itself that the user should be notified about",
              "isDeprecated": false,
              "name": "feedEventId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed the event belongs to",
              "isDeprecated": false,
              "name": "feedId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "UserUnreadFeedEvent",
          "possibleTypes": null
        },
        {
          "description": "Every time a notifition is delivered, delivery record is created to keep track of information about the delivery.\\nUsed for debugging when (and if) a user is receiving notifiations.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "When the message about the notification was delivered",
              "isDeprecated": false,
              "name": "deliveredAt",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The activity feed that the notification originated from",
              "isDeprecated": false,
              "name": "feed",
              "type": {
                "kind": "OBJECT",
                "name": "Feed",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The exact feed event (message) the notification originated from",
              "isDeprecated": false,
              "name": "feedEvent",
              "type": {
                "kind": "OBJECT",
                "name": "FeedEvent",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user the notification was delivered to.",
              "isDeprecated": false,
              "name": "recipient",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The medium of delivery. Currently can be push or email.",
              "isDeprecated": false,
              "name": "type",
              "type": {
                "kind": "ENUM",
                "name": "NotificationDeliveryType",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "NotificationDelivery",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The end date when the user has this availability.\\nMust be a Sunday to confirm to the US calendar week.\\n",
              "name": "endDate",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Date",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The project the user is committing the hours to. Leave this out to submit overall availability.",
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "CardId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The start period when the user has this availability.\\nMust be a Sunday to confirm to the US calendar week.\\n",
              "name": "startDate",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Date",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The amount of time per week the user has available to from startDate to endDate (inclusive)\\n",
              "name": "timePerWeek",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Duration",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The user to update the availabiltiy for",
              "name": "userId",
              "type": {
                "kind": "SCALAR",
                "name": "UserId",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "UpdateAvailabilityInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The id from the conversation to which the user should be added.\\n",
              "name": "conversationId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "ConversationId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The id from the user which should be added to the conversation.\\n",
              "name": "userId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "UserId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "AddParticipantToConversationInput",
          "possibleTypes": null
        },
        {
          "description": "Wrapper for a date scalar",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "date",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "value",
              "type": {
                "kind": "SCALAR",
                "name": "Date",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "DateObject",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The feed event to delete",
              "name": "feedEventId",
              "type": {
                "kind": "SCALAR",
                "name": "FeedEventId",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "FeedDeleteMessageInput",
          "possibleTypes": null
        },
        {
          "description": "A card had its budget increased or set for the first time.\\nEvery card can have a budget. This is used so a customer can budget a feature.\\nFor example, a customer could limit the cost of a feature to 100h.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that increased the budget",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that increased the budget",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The amount the card's budget was increased by",
              "isDeprecated": false,
              "name": "budget",
              "type": {
                "kind": "OBJECT",
                "name": "CardBudget",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card which had its budget increased",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card which had its budget increased",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardBudgetIncreased",
          "possibleTypes": null
        },
        {
          "description": "A user edited the content of an existing message in a feed.",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that edited the message",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that edited the message",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed the edited message belongs to",
              "isDeprecated": false,
              "name": "feed",
              "type": {
                "kind": "OBJECT",
                "name": "Feed",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The id of the edited message",
              "isDeprecated": false,
              "name": "feedEventId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed the edited message belongs to",
              "isDeprecated": false,
              "name": "feedId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The new body of the message",
              "isDeprecated": false,
              "name": "messageBody",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the feed belongs to.\\n(Direct messages don't belong to projects so it will be null for direct messages.)\\n",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "FeedMessageEdited",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": [
            {
              "deprecationReason": null,
              "description": "Accounts outside of the Turtle universe. Like where freelancer payouts go to or customer deposits come from.",
              "isDeprecated": false,
              "name": "EXTERNAL"
            },
            {
              "deprecationReason": null,
              "description": "The account for a project. This gets deposited when a customer pays. Balance is deducted when a freelancer tracks time.",
              "isDeprecated": false,
              "name": "PROJECT"
            },
            {
              "deprecationReason": null,
              "description": "Accounts internal to Turtle like turtle:recruiting or turtle:management",
              "isDeprecated": false,
              "name": "TURTLE"
            },
            {
              "deprecationReason": null,
              "description": "The account for a user. This gets deposited when they track time. When they get paid, withdrawls come from here.",
              "isDeprecated": false,
              "name": "USER"
            }
          ],
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "ENUM",
          "name": "AccountType",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": [
            {
              "deprecationReason": null,
              "description": "The recording is ready to be downloaded or played",
              "isDeprecated": false,
              "name": "COMPLETED"
            },
            {
              "deprecationReason": null,
              "description": "The recording was deleted so can no longer be accessed",
              "isDeprecated": false,
              "name": "DELETED"
            },
            {
              "deprecationReason": null,
              "description": "The recording is in line for being processed",
              "isDeprecated": false,
              "name": "ENQUEUED"
            },
            {
              "deprecationReason": null,
              "description": "The recording is still being encoded",
              "isDeprecated": false,
              "name": "PROCESSING"
            }
          ],
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "ENUM",
          "name": "MeetingRecordingStatus",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The conversation id.\\n",
              "isDeprecated": false,
              "name": "conversationId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The date and time of when the user became a member of the conversation.\\n",
              "isDeprecated": false,
              "name": "since",
              "type": {
                "kind": "SCALAR",
                "name": "DateTime",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user information.\\n",
              "isDeprecated": false,
              "name": "user",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user id.\\n",
              "isDeprecated": false,
              "name": "userId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "Participant",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The user to assign the card to. Self-assign by passing in the current user id.",
              "name": "assigneeId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "UserId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The card to assign",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardAssignInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": [
            {
              "deprecationReason": null,
              "description": "Meeting completed and is in the past. All participants have left.",
              "isDeprecated": false,
              "name": "COMPLETED"
            },
            {
              "deprecationReason": null,
              "description": "Creating the meeting failed for an unknown reason.",
              "isDeprecated": false,
              "name": "FAILED"
            },
            {
              "deprecationReason": null,
              "description": "Meeting is ongoing with 1+ participants in the call",
              "isDeprecated": false,
              "name": "IN_PROGRESS"
            }
          ],
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "ENUM",
          "name": "MeetingStatus",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The amount that the user got paid",
              "name": "amount",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Usd",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The date the payment was made. Just used for record keeping.",
              "name": "date",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Date",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The transaction fee involved. May differ between payment providers.",
              "name": "fee",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Usd",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The memo fo the payout. The user who got paid will see this in their statement.",
              "name": "memo",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The way the user got paid. Usually the name of 3rd party service. Currently can be payoneer, paypal, popmoney, wire, square, transferwise, check, adjustment",
              "name": "method",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "A unique identifier of the payout. Depends on the 3rd party service that was used to pay.",
              "name": "payoutId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The user that got paid",
              "name": "userId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "UserId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "RecordPayoutInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "Timezone",
          "possibleTypes": null
        },
        {
          "description": "The authentication result after joining a twilio meeting room.",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The token used for requests related to a twilio meeting room",
              "isDeprecated": false,
              "name": "token",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "TwilioAuth",
          "possibleTypes": null
        },
        {
          "description": "An hourly contract between a project and user. Used in generating transactions when a user tracks time.\\nIt is worth noting that contracts are immutable. They can only be started and ended. (This is to avoid complications which we don't get into here.)\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "Whether the contract is currently ongoing. Becomes false once a contract is ended.",
              "isDeprecated": false,
              "name": "active",
              "type": {
                "kind": "SCALAR",
                "name": "Boolean",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user who earns money for doing hourly work.",
              "isDeprecated": false,
              "name": "contractor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The amount of money the contractor earns for each hour billed.",
              "isDeprecated": false,
              "name": "contractorHourlyRate",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The amount of money the customer spends for each hour the contractor bills.",
              "isDeprecated": false,
              "name": "customerHourlyRate",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The time the contract was ended. Empty if the contract is currently active.",
              "isDeprecated": false,
              "name": "endedAt",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the contractor does work for.",
              "isDeprecated": false,
              "name": "project",
              "type": {
                "kind": "OBJECT",
                "name": "Project",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The time the contract was started.",
              "isDeprecated": false,
              "name": "startedAt",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "Contract",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "THe list of roles to give a user.\\nThis overwrites teh entire list. So if you want to add a role, you must pass in the full list with the new role added.\\n",
              "name": "roles",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "ENUM",
                  "name": "Role",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The user to update the roles for.",
              "name": "userId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "UserId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "UserSetRolesInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "AccountId",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The card to set the estimate for",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "how long you think this card (task) will take to complete",
              "name": "estimate",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardEstimateSetInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "Pass in 'new' on the client. The server will replace with a generated id.",
              "name": "contractId",
              "type": {
                "kind": "SCALAR",
                "name": "NewId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "How much the contractor earns per hour when they track time",
              "name": "contractorHourlyRate",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Usd",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The contractor the contract is tied to",
              "name": "contractorId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "UserId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "How much the customer gets billed per hour when the contractor tracks time",
              "name": "customerHourlyRate",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Usd",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The project the contract is tied to",
              "name": "projectId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "ContractStartInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "Raw",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "label",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "stages",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "HubspotDealStage",
                  "ofType": null
                }
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "HubspotPipeline",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "FeedEventId",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardEstimateUnsetInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Remove an estimate a card (task).\\n",
              "isDeprecated": false,
              "name": "cardEstimateUnset",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "FeedMarkAsReadInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Mark all unread feed events (unread by you) in a feed as read.\\nIf all feed events have already been read, this results in a no-op.\\n",
              "isDeprecated": false,
              "name": "feedMarkAsRead",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardCreateInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Create a new card. This could either mean creating a project or a task.\\n",
              "isDeprecated": false,
              "name": "cardCreate",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "UserSetSkillsInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Set the skills a user has. Used by Turtle internally to match contractors to new projects.",
              "isDeprecated": false,
              "name": "userSetSkills",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "UpdateAvailabilityInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Update a user's availability based on how many hours/week they are free to work on Turtle.\\nThis can be used to compare their desired workload with actual workload from time entries.\\n\\nCurrently, availability is based on week-blocks (Sun-Sat) to keep things simple.\\n\\nFor example, this is a visual representation of an availability calendar for a user gets filled:\\n\\nMay 2019                timePerWeek\\nSu Mo Tu We Th Fr Sa\\n         1  2  3  4     10h\\n5  6  7  8  9 10 11     15h\\n12 13 14 15 16 17 18    20h\\n19 20 21 22 23 24 25    10h\\n26 27 28 29 30 31       10h\\n",
              "isDeprecated": false,
              "name": "updateAvailability",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "RemoveParticipantFromConversationInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Removes a user from a conversation.\\n",
              "isDeprecated": false,
              "name": "removeParticipantFromConversation",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "ContractStartInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Start a contract between a person and a project.\\nThis is required for a contractor to start billing time and working on a project so the accounting system can generate the proper transactions when time is tracked.\\nNote: contracts are immutable. To change a contractor's rate, you must end a contract and start a new one.\\nA user can have a max of one contract per project.\\n",
              "isDeprecated": false,
              "name": "contractStart",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "AccountOpenInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Open an account if one doesn't already exist",
              "isDeprecated": false,
              "name": "accountOpen",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardBudgetIncreaseInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Decrease the budget of a card. To set the initial budget of a card, use this command.\\nEvery card can have a budget. This is used so a customer can budget a feature.\\nFor example, a customer could limit the cost of a feature to 100h.\\nBudgets operations are relative so the user can work relative to the current budget.\\n",
              "isDeprecated": false,
              "name": "cardBudgetIncrease",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "userId",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "UserId",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Link or create HubSpot contact",
              "isDeprecated": false,
              "name": "linkOrCreateHubSpotContact",
              "type": {
                "kind": "OBJECT",
                "name": "HubspotContact",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardLinkDeleteInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Remove a directional link between two cards.\\n",
              "isDeprecated": false,
              "name": "cardLinkDelete",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "RecordPayoutInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Record a payout to a user.\\nEach user has an acccount with a balance. When time is billed, send a referral, etc, their balance increasses.\\nOnce a payout is recorded, their balance decreases by the amount they were paid.\\n\\nImagine a contractor has \$500 in their account. They get paid \$400. Their balance will now be \$100.\\n",
              "isDeprecated": false,
              "name": "recordPayout",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardUncompleteInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Mark a completed task as incomplete again",
              "isDeprecated": false,
              "name": "cardUncomplete",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "ProjectAddBalanceWithStripeInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Refill your project balance by paying with Stripe.\\nEach project has an associated project:idofproject account which the balance will get deposited into.\\n",
              "isDeprecated": false,
              "name": "projectAddBalanceWithStripe",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "ContractEndInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "End a contract.\\nThis means time can no longer be tracked by a contractor to this project without a new contract being started.\\n",
              "isDeprecated": false,
              "name": "contractEnd",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "SendMessageToConversationInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Sends a message to a conversation.\\n",
              "isDeprecated": false,
              "name": "sendMessageToConversation",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "UpdateConversationTopicInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Updates a conversation topic.\\n",
              "isDeprecated": false,
              "name": "updateConversationTopic",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardTagsSetInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Set the tags of a card. Overwrites the previous list of tags.\\nIf you want to add a tag, make sure to pass the entire list of tags with the new tag.\\n",
              "isDeprecated": false,
              "name": "cardTagsSet",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "ProfileNameSetInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Set your full name.\\nThis will override whatever is taken from your auth account (like google).\\nThis will also affect mentions in chat.\\n",
              "isDeprecated": false,
              "name": "profileNameSet",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CreateConversationInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Creates a new conversation and adds its creator as a participant.\\n",
              "isDeprecated": false,
              "name": "createConversation",
              "type": {
                "kind": "OBJECT",
                "name": "Conversation",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "RemoveReactionInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Remove a reaction from a feed event.\\nAll feed events within a feed can have reactions. Just like Slack, HipChat, etc.\\n",
              "isDeprecated": false,
              "name": "removeReaction",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardRenameInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Change the name of a card (or project)",
              "isDeprecated": false,
              "name": "cardRename",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardUnassignInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Remove the assignee for a card (task)",
              "isDeprecated": false,
              "name": "cardUnassign",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardDueDateSetInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Set the due date of a card.\\nUse CardDueDateUnset to remove the due date.\\n",
              "isDeprecated": false,
              "name": "cardDueDateSet",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "ProfileTimezoneSetInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Set your current timezone.\\nWill be used by managers and the Turtle platform to help with coordinating meetings/communication.\\n",
              "isDeprecated": false,
              "name": "profileTimezoneSet",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardBudgetUnsetInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Completely remove the budget for a card.\\nUsually used if a customer decides they don't want a budget anymore.\\n",
              "isDeprecated": false,
              "name": "cardBudgetUnset",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "AddReactionInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Add a reaction to a feed event.\\nAll feed events within a feed can have reactions. Just like Slack, HipChat, etc.\\n",
              "isDeprecated": false,
              "name": "addReaction",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardRemoveMemberInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Remove a user from a project.\\nThey will lose access to everything in the project.\\n",
              "isDeprecated": false,
              "name": "cardRemoveMember",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "TimeEntryDeleteInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Deletes the time entry for work that was done.\\nGenerates a transaction that takes money from your account and gives it back to the customer.\\n",
              "isDeprecated": false,
              "name": "timeEntryDelete",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardBudgetDecreaseInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Decrease the budget of a card.\\nEvery card can have a budget. This is used so a customer can budget a feature.\\nFor example, a customer could limit the cost of a feature to 100h.\\nBudgets operations are relative so the user can work relative to the current budget.\\n",
              "isDeprecated": false,
              "name": "cardBudgetDecrease",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardMoveInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Move a card (task) from one location to another.\\nCurrently only possible to move cards that belong to a project within their own project.\\n",
              "isDeprecated": false,
              "name": "cardMove",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardInviteUserInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Add a user to a project and send them an e-mail notification saying they were invited to the project.\\n\\nIf the user exists by e-mail, this user will be invited.\\nIf the user doesn't exist by e-mail, an account will be created for the user.\\n",
              "isDeprecated": false,
              "name": "cardInviteUser",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "TimeEntryEditInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Modify one or more attributes of a time entry.\\nIf the duration is modified, an adjustment transaction is generated to make sure customer/user balances are accurate.\\n",
              "isDeprecated": false,
              "name": "timeEntryEdit",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "FeedEditMessageInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Edit the message body of a feed event\\n",
              "isDeprecated": false,
              "name": "feedEditMessage",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardDueDateUnsetInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Clear the due date of a card",
              "isDeprecated": false,
              "name": "cardDueDateUnset",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardCompleteInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Mark a card as complete",
              "isDeprecated": false,
              "name": "cardComplete",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "TimeEntryCreateInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Track logs for work that you have done.\\nGenerates a transaction that deducts from customer account and adds to the your account.\\n",
              "isDeprecated": false,
              "name": "timeEntryCreate",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "UserSetRolesInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Set the roles of a user. Overwrites the previous list of roles.",
              "isDeprecated": false,
              "name": "userSetRoles",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardLinkCreateInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Create a directional link between two cards. This is kind of like a hyperlink.\\nUsed for things like tying an internal management project to a customer project.\\n\\nCurrently, links are unique by link_type, from_id, and to_id.\\nTrying to create two links with all of these the same will result in an error.\\n",
              "isDeprecated": false,
              "name": "cardLinkCreate",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "AccountTransferInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Transfer money from one account to another.",
              "isDeprecated": false,
              "name": "accountTransfer",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "FeedDeleteMessageInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Delete a feed event (message) in a feed.",
              "isDeprecated": false,
              "name": "feedDeleteMessage",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "projectId",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "SCALAR",
                      "name": "CardId",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "meetingRoomJoin",
              "type": {
                "kind": "OBJECT",
                "name": "TwilioAuth",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardAddMemberInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Add a user to a project.",
              "isDeprecated": false,
              "name": "cardAddMember",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "SendLowBalanceReminderInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Send a reminder to a customer about their project once their balance becomes low.\\nBecause of the nuances around timing when to send these e-mails, this is currently a manual operation.\\n\\nThe e-mail says something like this:\\n\\nHi John,\\n\\nThis is a friendly reminder that your Turtle balance for ACME is now ___.\\n...\\n",
              "isDeprecated": false,
              "name": "sendLowBalanceReminder",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "AddParticipantToConversationInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Adds a user to a conversation.\\n",
              "isDeprecated": false,
              "name": "addParticipantToConversation",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardUndeleteInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Restore a deleted card and all of its subtasks.\\n",
              "isDeprecated": false,
              "name": "cardUndelete",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardAssignInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Assign a card to a user",
              "isDeprecated": false,
              "name": "cardAssign",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardEstimateSetInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Set (or update) an estimated for how long you think a card (task) will take to complete. For example 5-10h.\\n",
              "isDeprecated": false,
              "name": "cardEstimateSet",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "FeedPostMessageInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Post a message to a feed. Similar to posting a message in Slack or HipChat.",
              "isDeprecated": false,
              "name": "feedPostMessage",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "input",
                  "type": {
                    "kind": "NON_NULL",
                    "name": null,
                    "ofType": {
                      "kind": "INPUT_OBJECT",
                      "name": "CardDeleteInput",
                      "ofType": null
                    }
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Delete a card (project/task)\\nDeleting a card which has subtasks will also mark those subtasks as deleted.\\nRsetoring those tasks with [CardUndelete] will also restore those subtasks.\\n",
              "isDeprecated": false,
              "name": "cardDelete",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "RootMutationType",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The card (task) the work was done on",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The date the work was done",
              "name": "entryDate",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Date",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "How long the work took",
              "name": "entryDuration",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Duration",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The id of the time entry. You must pass in 'new' and it will get generated server-side.",
              "name": "entryId",
              "type": {
                "kind": "SCALAR",
                "name": "NewId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "More detailed notes about the work done",
              "name": "entryMemo",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "TimeEntryCreateInput",
          "possibleTypes": null
        },
        {
          "description": "A range of duration, such as 1.5-2h.",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The upper bound of the range. If max is the same as min, then it represents a single value like 2h.",
              "isDeprecated": false,
              "name": "max",
              "type": {
                "kind": "SCALAR",
                "name": "Duration",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The lower bound of the range",
              "isDeprecated": false,
              "name": "min",
              "type": {
                "kind": "SCALAR",
                "name": "Duration",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "DurationRange",
          "possibleTypes": null
        },
        {
          "description": "After paying someone, a manager recorded a payment in the accounting system.\\nGenerates a transaction.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that recorded the payout",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that recorded the payout",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The amount of money paid to the freelancer",
              "isDeprecated": false,
              "name": "amount",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The date the payment was made",
              "isDeprecated": false,
              "name": "date",
              "type": {
                "kind": "SCALAR",
                "name": "Date",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The transaction fee that was paid to the 3rd party provider.",
              "isDeprecated": false,
              "name": "fee",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Any notes about the payment",
              "isDeprecated": false,
              "name": "memo",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The type of payment. For example, ach, paypal, adjustment.",
              "isDeprecated": false,
              "name": "method",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The 3rd party identifier for the payout. For example, with Payoneer, this would be the payment id you find by logging into Payoneer.\\n",
              "isDeprecated": false,
              "name": "payoutId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that was paid",
              "isDeprecated": false,
              "name": "user",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that was paid",
              "isDeprecated": false,
              "name": "userId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "PayoutRecorded",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The card to remove the budget for",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardBudgetUnsetInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The conversation id.\\n",
              "name": "conversationId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "ConversationId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The conversation topic.\\n",
              "name": "topic",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "UpdateConversationTopicInput",
          "possibleTypes": null
        },
        {
          "description": "A new card was created.\\nIf the card is a project (root card), then parentId will be null and the projectId will equal to the cardId.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that created the card",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that created the card",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card that was created.\\nNote that this is the latest reference to the card. It's not a snapshot of the card when it was created.\\n",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The id of the newly created card",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The name of the card. This is what shows up in a tree view of a task manager.",
              "isDeprecated": false,
              "name": "cardName",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The parent card it was created under. This is null if a root project-card was created.\\nNote that this is the latest reference to the parent. It's not a snapshot of the card when it was created.\\n",
              "isDeprecated": false,
              "name": "parent",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The parent card it was created under. This is null if a root project-card was created.",
              "isDeprecated": false,
              "name": "parentId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project that the card was created in. If a project-card was created, this is equal to the id of the card.",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardCreated",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The card the link will come from",
              "name": "fromId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The type of link. For example management or turtle_support.",
              "name": "linkType",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The card the link will go to",
              "name": "toId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardLinkCreateInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "CreditCardId",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "executedAt",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "input",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "type",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "Command",
          "possibleTypes": null
        },
        {
          "description": "When a user has read an event, this event is generated.\\nThis, in combination with [UserUnreadFeedEvent], can be used to generate unread counts per feed.\\nNote: UserReadFeedEvent is guaranteed to be unique and may not be balanced with [UserReadFeedEvent].\\nSo make sure you process the events in an idempotent way. We intend to change this behavior in the future.\\nThe meaning of 'read' is determined by the client.\\nFor example, it could be when a user clicks on an activity feed. Or when could be a user scrolls to see the message.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that read the event",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The event itself that was read by the user",
              "isDeprecated": false,
              "name": "feedEventId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed the event belongs to",
              "isDeprecated": false,
              "name": "feedId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "UserReadFeedEvent",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "Json",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user this card is assigned to",
              "isDeprecated": false,
              "name": "assignee",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The id of the user this card is assigned to",
              "isDeprecated": false,
              "name": "assigneeId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The budget specific to this card.\\nFor example a customer may set a 150h budget for a feature.\\nDoes not include budgets of child cards. For reporting, aggregations must be done on the client.\\n",
              "isDeprecated": false,
              "name": "budget",
              "type": {
                "kind": "OBJECT",
                "name": "CardBudget",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "completed",
              "type": {
                "kind": "SCALAR",
                "name": "Boolean",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The time when the card was most recently marked completed.",
              "isDeprecated": false,
              "name": "completedAt",
              "type": {
                "kind": "SCALAR",
                "name": "DateTime",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The time the card was reated",
              "isDeprecated": false,
              "name": "createdAt",
              "type": {
                "kind": "SCALAR",
                "name": "DateTime",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Whether the card is marked deleted or not. If a card is deleted, its children are also marked deleted.",
              "isDeprecated": false,
              "name": "deleted",
              "type": {
                "kind": "SCALAR",
                "name": "Boolean",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": "15",
                  "description": "The number of levels to return. Passing 1 only returns immediate children. Passing 2 returns children and their children. And so on",
                  "name": "depth",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Int",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": "true",
                  "description": "Whether to exclude cards which have been deleted. If a card is deleted, all of its children are also considered deleted.",
                  "name": "excludeDeleted",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Boolean",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Child cards, grandchild cards, and so on. Can control depth and filters.",
              "isDeprecated": false,
              "name": "descendants",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Card",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "dueDate",
              "type": {
                "kind": "SCALAR",
                "name": "Date",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Estimate for how long a developer this this task will take. For example 10-15h.\\nDoes not include estimates of child cards.\\n",
              "isDeprecated": false,
              "name": "estimate",
              "type": {
                "kind": "OBJECT",
                "name": "DurationRange",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The associated feed for this card. Every card has an activity feed.",
              "isDeprecated": false,
              "name": "feed",
              "type": {
                "kind": "OBJECT",
                "name": "Feed",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The associated feed id for this card. Every card has an activity feed.",
              "isDeprecated": false,
              "name": "feedId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The users that are members of the current card. Only applies to root project cards.",
              "isDeprecated": false,
              "name": "members",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "User",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "meta",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The title of the card. This is what is usually rendered in a task list.",
              "isDeprecated": false,
              "name": "name",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Card links that point from this card to another card.",
              "isDeprecated": false,
              "name": "outgoingLinks",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "CardLink",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The id of the parent card. The root project card will not have this set.",
              "isDeprecated": false,
              "name": "parentId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "An integer representing the order of this card with respect to its siblings.\\nFrontend should sort children of a card by this propertly. There may be spaces like [1, 10, 15]\\n",
              "isDeprecated": false,
              "name": "position",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to. The root card itself is a project. In this case projectId and id will be equal.",
              "isDeprecated": false,
              "name": "project",
              "type": {
                "kind": "OBJECT",
                "name": "Project",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The id of the project the card belongs to. The root card itself is a project. In this case projectId and id will be equal.",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "All time entries tracked for this card.",
              "isDeprecated": false,
              "name": "timeEntries",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "TimeEntry",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The total time tracked with time entries this card. Does not include time tracked on children.",
              "isDeprecated": false,
              "name": "timeTracked",
              "type": {
                "kind": "SCALAR",
                "name": "Duration",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.",
              "isDeprecated": false,
              "name": "version",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "Card",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "balance",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": "use balance which is more appropriately named",
              "description": null,
              "isDeprecated": true,
              "name": "budget",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "contracts",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Contract",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "estimatedHourlyRate",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": "20",
                  "description": null,
                  "name": "limit",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Int",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": "0",
                  "description": null,
                  "name": "offset",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Int",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": "ALL",
                  "description": null,
                  "name": "show",
                  "type": {
                    "kind": "ENUM",
                    "name": "ReadStatus",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "feeds",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Feed",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "lastActivity",
              "type": {
                "kind": "SCALAR",
                "name": "DateTime",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "lastChargedCard",
              "type": {
                "kind": "OBJECT",
                "name": "CreditCard",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "managerOverdueCards",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Card",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "managers",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "User",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "members",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "User",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "meta",
              "type": {
                "kind": "SCALAR",
                "name": "Raw",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "name",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "projectStatusTags",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "rootCard",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "endDate",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": null,
                  "name": "startDate",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries before the date of work. (Inclusive)",
                  "name": "workDoneEnd",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries after the date of work. (Inclusive)",
                  "name": "workDoneStart",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "timeEntries",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "TimeEntry",
                  "ofType": null
                }
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "Project",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The card of the due date to clear",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardDueDateUnsetInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The feed event to add the reaction to",
              "name": "feedEventId",
              "type": {
                "kind": "SCALAR",
                "name": "FeedEventId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The reaction to add. Should be an emoji like 👍",
              "name": "reaction",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "AddReactionInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": [
            {
              "deprecationReason": null,
              "description": "Won't show up under their list of subscribed activity feeds",
              "isDeprecated": false,
              "name": "DELETED"
            },
            {
              "deprecationReason": null,
              "description": "Current user is following, so will receieve notifications",
              "isDeprecated": false,
              "name": "FOLLOWING"
            },
            {
              "deprecationReason": null,
              "description": "Current user is subscribed and will see new messages but won't receieve notifications",
              "isDeprecated": false,
              "name": "MUTED"
            }
          ],
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "ENUM",
          "name": "FeedSubscriptionStatus",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "UserId",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": [
            {
              "deprecationReason": null,
              "description": "You can access the admin-related page for any project",
              "isDeprecated": false,
              "name": "ADMIN_VIEW"
            },
            {
              "deprecationReason": null,
              "description": "You can view your own tracked hours and personal account",
              "isDeprecated": false,
              "name": "MY_ACCOUNTING_VIEW"
            },
            {
              "deprecationReason": null,
              "description": "You can view the budget screen for any project",
              "isDeprecated": false,
              "name": "PROJECT_ACCOUNTING_VIEW"
            },
            {
              "deprecationReason": null,
              "description": "You can add/remove users to any project",
              "isDeprecated": false,
              "name": "PROJECT_MEMBERS_MANAGE"
            }
          ],
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "ENUM",
          "name": "Permission",
          "possibleTypes": null
        },
        {
          "description": "A user edited deleted an existing message in a feed.",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that deleted the message",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that deleted the message",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed the edited message belongs to",
              "isDeprecated": false,
              "name": "feed",
              "type": {
                "kind": "OBJECT",
                "name": "Feed",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The id of the deleted message",
              "isDeprecated": false,
              "name": "feedEventId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed the edited message belongs to",
              "isDeprecated": false,
              "name": "feedId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the feed belongs to.\\n(Direct messages don't belong to projects so it will be null for direct messages.)\\n",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "FeedMessageDeleted",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The id from the conversation to which the user should be removed.\\n",
              "name": "conversationId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "ConversationId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The id from the user which should be removed from the conversation.\\n",
              "name": "userId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "UserId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "RemoveParticipantFromConversationInput",
          "possibleTypes": null
        },
        {
          "description": "A file stored on S3 that was uploaded by a user.",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The mime content type",
              "isDeprecated": false,
              "name": "contentType",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The url for downloading a file to the users local computer. Used on the client when a download link is necessary.",
              "isDeprecated": false,
              "name": "downloadUri",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The name of the file",
              "isDeprecated": false,
              "name": "name",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The file path on S3 such as 'prod/uploads/27609051001642272405679805693952/somevid.mp4'",
              "isDeprecated": false,
              "name": "path",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Size of the file in bytes",
              "isDeprecated": false,
              "name": "size",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "If the file is an image, this will be set to a url that lets you resize it to a thumbnail size.\\nThe client can append parameters to dynamically resize the image such as ?w=400&h=400&fit=fillmax\\nSee https://docs.imgix.com/apis/url for more information.\\n",
              "isDeprecated": false,
              "name": "thumbnailUri",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The CDN url to the file. Can link to here, for example, if a video player needs to point to the file's url.",
              "isDeprecated": false,
              "name": "uri",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user id that uploaded the file",
              "isDeprecated": false,
              "name": "userId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "File",
          "possibleTypes": null
        },
        {
          "description": "Link to an internet webpage or an internal turtle link (like card or user)",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The title of the link. It's either the name of the entity or left blank.",
              "isDeprecated": false,
              "name": "title",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The type of entity that is linked to. It can be user, card, or link (default).",
              "isDeprecated": false,
              "name": "type",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The http://... url this goes to",
              "isDeprecated": false,
              "name": "uri",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "Link",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The number of contracts the user currently has active.",
              "isDeprecated": false,
              "name": "activeContractsCount",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Active contracts the user currently has",
              "isDeprecated": false,
              "name": "contracts",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Contract",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "email",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": "20",
                  "description": "Max number of records to return. Used for pagination",
                  "name": "limit",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Int",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": "0",
                  "description": "Number of records to skip. Used for pagination.",
                  "name": "offset",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Int",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": "SUBSCRIBED",
                  "description": "Limit the feeds returned by their read status.",
                  "name": "show",
                  "type": {
                    "kind": "ENUM",
                    "name": "ReadStatus",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "Activity feeds the user currently has access to. Sorted by most recently active first.",
              "isDeprecated": false,
              "name": "feeds",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Feed",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "hubspotContact",
              "type": {
                "kind": "OBJECT",
                "name": "HubspotContact",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Unique identifier for the user. A user may have multiple identies connected to a single user.",
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The full name of the user. Will be taken from their Google account on initial login. Can be overridden in their profile.",
              "isDeprecated": false,
              "name": "name",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The photo URL of the user taken from their logged in Google account.",
              "isDeprecated": false,
              "name": "photo",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Projects the user is currently a member of.",
              "isDeprecated": false,
              "name": "projects",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Project",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The system-wide rules a user has.",
              "isDeprecated": false,
              "name": "roles",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "ENUM",
                  "name": "Role",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The skills that the user has. Used for matching them to projects.",
              "isDeprecated": false,
              "name": "skills",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The registration status of the user. Can currently be either invited or active.",
              "isDeprecated": false,
              "name": "status",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": null,
                  "description": "Filter time entries with date <= end date (including end date)",
                  "name": "endDate",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter time entries with date >= start date (including start date)",
                  "name": "startDate",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries before the date of work. (Inclusive)",
                  "name": "workDoneEnd",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                },
                {
                  "defaultValue": null,
                  "description": "Filter to time entries after the date of work. (Inclusive)",
                  "name": "workDoneStart",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Date",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": "The time entries tracked by the current user",
              "isDeprecated": false,
              "name": "timeEntries",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "TimeEntry",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The timezone of the user related currently based on what we read from the browser.",
              "isDeprecated": false,
              "name": "timezone",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "User",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The sibling to move the card right after.\\nCan't pass in beforeId and afterId together.\\n",
              "name": "afterId",
              "type": {
                "kind": "SCALAR",
                "name": "CardId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The sibling to move the card right before.\\nCan't pass in beforeId and afterId together.\\n",
              "name": "beforeId",
              "type": {
                "kind": "SCALAR",
                "name": "CardId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The card to move",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The new parent to move the card under.\\nIf you're just reordering the list relative to siblings, set this to the current parent.\\n",
              "name": "toId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardMoveInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The project to add the user to.\\nIf left out, a user will be created for the e-mail (if one doesn't already exist).\\n",
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "CardId",
                "ofType": null
              }
            },
            {
              "defaultValue": null,
              "description": "The e-mail of the user to invite to the project. If the user with this e-mail exists, the",
              "name": "email",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "Email",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardInviteUserInput",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": [
            {
              "deprecationReason": null,
              "description": "All feeds",
              "isDeprecated": false,
              "name": "ALL"
            },
            {
              "deprecationReason": null,
              "description": "All messages in the feed were read",
              "isDeprecated": false,
              "name": "READ"
            },
            {
              "deprecationReason": null,
              "description": "Current user has subscribed to the feed, either explicitly or implicitly",
              "isDeprecated": false,
              "name": "SUBSCRIBED"
            },
            {
              "deprecationReason": null,
              "description": "There is at least 1 unread message in the feed",
              "isDeprecated": false,
              "name": "UNREAD"
            }
          ],
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "ENUM",
          "name": "ReadStatus",
          "possibleTypes": null
        },
        {
          "description": "The subscription for a specific user and feed.\\nContains user-specific info like unread counts.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed being subscribed to",
              "isDeprecated": false,
              "name": "feedId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "status",
              "type": {
                "kind": "ENUM",
                "name": "FeedSubscriptionStatus",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The number of unread messages in the feed for the user",
              "isDeprecated": false,
              "name": "unreadCount",
              "type": {
                "kind": "SCALAR",
                "name": "Int",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user subscribed to the feed",
              "isDeprecated": false,
              "name": "userId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.",
              "isDeprecated": false,
              "name": "version",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "FeedSubscription",
          "possibleTypes": null
        },
        {
          "description": "The `Float` scalar type represents signed double-precision fractional\\nvalues as specified by\\n[IEEE 754](http://en.wikipedia.org/wiki/IEEE_floating_point).",
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "Float",
          "possibleTypes": null
        },
        {
          "description": "The entity a feed is associated with.",
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "UNION",
          "name": "FeedSource",
          "possibleTypes": [
            {
              "kind": "OBJECT",
              "name": "Card",
              "ofType": null
            },
            {
              "kind": "OBJECT",
              "name": "User",
              "ofType": null
            }
          ]
        },
        {
          "description": null,
          "enumValues": null,
          "fields": null,
          "inputFields": [
            {
              "defaultValue": null,
              "description": "The card to rename",
              "name": "cardId",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "CardId",
                  "ofType": null
                }
              }
            },
            {
              "defaultValue": null,
              "description": "The new name to give the card",
              "name": "cardName",
              "type": {
                "kind": "NON_NULL",
                "name": null,
                "ofType": {
                  "kind": "SCALAR",
                  "name": "String",
                  "ofType": null
                }
              }
            }
          ],
          "interfaces": null,
          "kind": "INPUT_OBJECT",
          "name": "CardRenameInput",
          "possibleTypes": null
        },
        {
          "description": "A server-side generated ID. Just pass in the value 'new' and it will get replaced.",
          "enumValues": null,
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "SCALAR",
          "name": "NewId",
          "possibleTypes": null
        },
        {
          "description": "A single accounting entry (event) for an account.\\nWhenever a transaction is generated, it has 2+ accounting entries.\\n",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The total balance at this moment. (Includes the delta applied.)",
              "isDeprecated": false,
              "name": "balanceSnapshot",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The time the account entry and its transaction were generated.",
              "isDeprecated": false,
              "name": "createdAt",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The change in balance at this moment",
              "isDeprecated": false,
              "name": "delta",
              "type": {
                "kind": "OBJECT",
                "name": "Money",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "If a memo was entered, the contents of the memo.",
              "isDeprecated": false,
              "name": "memo",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The associated domain event that was used to generate this accounting entry and transaction.",
              "isDeprecated": false,
              "name": "sourceEvent",
              "type": {
                "kind": "INTERFACE",
                "name": "TurtleEvent",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "AccountEntry",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that posted the message or performed the action which generated the event.",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": "It is recommended to use the event field when rendering domain events in the activity feed.\\nIt is recommended to use body_tokens when rendering messages\\n",
              "description": "A string that represents the message that was posted or a text-summary of the event.\\nSuch as 'set due date to @date'\\n",
              "isDeprecated": true,
              "name": "body",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "An array of tokens used when rendering a message body.\\nIt may look like types of [string, date, file, ...]\\nOn the client, you could map over the array and convert each item to a widget that is rendered from left to right.\\n",
              "isDeprecated": false,
              "name": "bodyTokens",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "UNION",
                  "name": "DocumentToken",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The time the feed event was posted if it was a message or the time the event was generated.",
              "isDeprecated": false,
              "name": "createdAt",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Whether the message was edited. Also applies to other edits like time entries.",
              "isDeprecated": false,
              "name": "edited",
              "type": {
                "kind": "SCALAR",
                "name": "Boolean",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The time of the edit if edited=true",
              "isDeprecated": false,
              "name": "editedAt",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The domain event that corresponds to this feed event.",
              "isDeprecated": false,
              "name": "event",
              "type": {
                "kind": "INTERFACE",
                "name": "TurtleEvent",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The feed id this belongs to",
              "isDeprecated": false,
              "name": "feedId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Unique identifier of the feed event. It is time-ordered so sorting by ids results in order of creation.",
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "An array of individual reactions to messages. Multiple users reacting with the same emoji results in distinct records. ",
              "isDeprecated": false,
              "name": "reactions",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "Reaction",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.",
              "isDeprecated": false,
              "name": "version",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "FeedEvent",
          "possibleTypes": null
        },
        {
          "description": "A user was removed from a project",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user performing the action. The one who added the user to the project.",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user performing the action. The one who added the user to the project.",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the user was removed from",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": "Use projectId instead since cardId will always point to a project.",
              "description": "The id of the card",
              "isDeprecated": true,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that was removed from the project",
              "isDeprecated": false,
              "name": "member",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardMemberRemoved",
          "possibleTypes": null
        },
        {
          "description": "A user removed the estimate for a card (task)",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that set the estimate",
              "isDeprecated": false,
              "name": "actor",
              "type": {
                "kind": "OBJECT",
                "name": "User",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The user that removed the estimate",
              "isDeprecated": false,
              "name": "actorId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card the estimate was removed for",
              "isDeprecated": false,
              "name": "card",
              "type": {
                "kind": "OBJECT",
                "name": "Card",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The card the estimate was removed for",
              "isDeprecated": false,
              "name": "cardId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "id",
              "type": {
                "kind": "SCALAR",
                "name": "ID",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": "The project the card belongs to",
              "isDeprecated": false,
              "name": "projectId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "requestId",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "time",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [
            {
              "kind": "INTERFACE",
              "name": "TurtleEvent",
              "ofType": null
            }
          ],
          "kind": "OBJECT",
          "name": "CardEstimateUnset",
          "possibleTypes": null
        },
        {
          "description": "Represents a schema",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "directives",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "__Directive",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "mutationType",
              "type": {
                "kind": "OBJECT",
                "name": "__Type",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "queryType",
              "type": {
                "kind": "OBJECT",
                "name": "__Type",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "subscriptionType",
              "type": {
                "kind": "OBJECT",
                "name": "__Type",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "types",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "__Type",
                  "ofType": null
                }
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "__Schema",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": [
            {
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "FIELD"
            },
            {
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "FRAGMENT_DEFINITION"
            },
            {
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "FRAGMENT_SPREAD"
            },
            {
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "INLINE_FRAGMENT"
            },
            {
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "MUTATION"
            },
            {
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "QUERY"
            },
            {
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "SUBSCRIPTION"
            }
          ],
          "fields": null,
          "inputFields": null,
          "interfaces": null,
          "kind": "ENUM",
          "name": "__DirectiveLocation",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "defaultValue",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "description",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "name",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "type",
              "type": {
                "kind": "OBJECT",
                "name": "__Type",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "__InputValue",
          "possibleTypes": null
        },
        {
          "description": "Represents a directive",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "args",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "__InputValue",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "description",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "locations",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "ENUM",
                  "name": "__DirectiveLocation",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "name",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": "Check `locations` field for enum value FIELD",
              "description": null,
              "isDeprecated": true,
              "name": "onField",
              "type": {
                "kind": "SCALAR",
                "name": "Boolean",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": "Check `locations` field for enum value FRAGMENT_SPREAD",
              "description": null,
              "isDeprecated": true,
              "name": "onFragment",
              "type": {
                "kind": "SCALAR",
                "name": "Boolean",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": "Check `locations` field for enum value OPERATION",
              "description": null,
              "isDeprecated": true,
              "name": "onOperation",
              "type": {
                "kind": "SCALAR",
                "name": "Boolean",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "__Directive",
          "possibleTypes": null
        },
        {
          "description": "Represents scalars, interfaces, object types, unions, enums in the system",
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "description",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [
                {
                  "defaultValue": "false",
                  "description": null,
                  "name": "includeDeprecated",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Boolean",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "enumValues",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "__EnumValue",
                  "ofType": null
                }
              }
            },
            {
              "args": [
                {
                  "defaultValue": "false",
                  "description": null,
                  "name": "includeDeprecated",
                  "type": {
                    "kind": "SCALAR",
                    "name": "Boolean",
                    "ofType": null
                  }
                }
              ],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "fields",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "__Field",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "inputFields",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "__InputValue",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "interfaces",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "__Type",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "kind",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "name",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "ofType",
              "type": {
                "kind": "OBJECT",
                "name": "__Type",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "possibleTypes",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "__Type",
                  "ofType": null
                }
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "__Type",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "deprecationReason",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "description",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "isDeprecated",
              "type": {
                "kind": "SCALAR",
                "name": "Boolean",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "name",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "__EnumValue",
          "possibleTypes": null
        },
        {
          "description": null,
          "enumValues": null,
          "fields": [
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "args",
              "type": {
                "kind": "LIST",
                "name": null,
                "ofType": {
                  "kind": "OBJECT",
                  "name": "__InputValue",
                  "ofType": null
                }
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "deprecationReason",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "description",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "isDeprecated",
              "type": {
                "kind": "SCALAR",
                "name": "Boolean",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "name",
              "type": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            {
              "args": [],
              "deprecationReason": null,
              "description": null,
              "isDeprecated": false,
              "name": "type",
              "type": {
                "kind": "OBJECT",
                "name": "__Type",
                "ofType": null
              }
            }
          ],
          "inputFields": null,
          "interfaces": [],
          "kind": "OBJECT",
          "name": "__Field",
          "possibleTypes": null
        }
      ]
    }
  }
}""";
}

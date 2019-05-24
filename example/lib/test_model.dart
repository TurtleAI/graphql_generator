import 'package:graphql_generator/annotation.dart';

@GQLGenerator(
    // graphiql doesn't require a token for introspection schema
    url: "https://turtle-api.herokuapp.com/graphiql",
    headerToken: "",
    namespace: "T",
    types: {
      "Duration": bool,
      "ID": int,
      "Raw": dynamic
    },
    fragments: {
      "Card": """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """
    })
String value;

import 'package:graphql_generator/annotation.dart';

@GQLGenerator(
    url: "https://turtle-api.herokuapp.com/graphql",
    headerToken:
    "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJUdXJ0bGUiLCJleHAiOjE1NjM0NzkzODYsImlhdCI6MTU1ODY0MDk4NiwiaXNzIjoiVHVydGxlIiwianRpIjoiOWUwNTVjZmYtNjNmZC00NDQyLTgxOTQtNDI2NTg4ODQwNmIwIiwibmJmIjoxNTU4NjQwOTg1LCJzdWIiOiJ1c2VyOjI4NDU2NzIzNTc2MjczMjIzNjkyNzUzMzcxNjYwMjg5IiwidHlwIjoiYWNjZXNzIn0.ceERGzJnhx4M0TJbQryhLA9l644jc_tgsGQPrlhXe8f59z3WfN5SRMDXXnmzxV-FLJhphB16Cw09so_G7wMHeQ",
    namespace: "T",
    types: {
      "Duration": bool,
      "ID": int,
      "Raw": dynamic
    },
    fragments: {
      "Card":
      """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """
    })
String value;

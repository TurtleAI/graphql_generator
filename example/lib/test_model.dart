import 'package:graphql_generator/annotation.dart';

@GQLGenerator(
    url: "https://turtle-api.herokuapp.com/graphql",
    headerToken:
    "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJUdXJ0bGUiLCJleHAiOjE1NTg2MjU1NjksImlhdCI6MTU1Mzc4NzE2OSwiaXNzIjoiVHVydGxlIiwianRpIjoiZGRiZTA2ZjUtYmNhNi00NmViLWE3YTYtZDI0NzIyMmRlMTVlIiwibmJmIjoxNTUzNzg3MTY4LCJzdWIiOiJ1c2VyOjI4NDU2NzIzNTc2MjczMjIzNjkyNzUzMzcxNjYwMjg5IiwidHlwIjoiYWNjZXNzIn0.ejIb_RZUNcyWSyHJDGsp2sw2lLXhZX5BXF5Gt23-0N2bwYwt08YUwGFkIQ9ZMpaII_8WmNLzdZbAZZfQsCa9aw",
    namespace: "T",
    types: {"Duration": bool, "ID": int})
//@GQLGenerator(
//    url:'https://api.github.com/graphql',
//    headerToken: 'bearer b28b25a0de97daca37270798ecf59832ba206096',
//    namespace: "T"
//)
String value;

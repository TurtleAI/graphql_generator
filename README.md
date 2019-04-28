# graphql_generator


## Getting Started
First of all clone this repository to the project in which you need to apply this plugin.

Then add to the following line to your ```pubspec.yaml```
```
dependencies:
  graphql_generator:
    path: <LOCATION OF THE CLONED PACKAGE>
dev_dependencies:
  build_runner: any
```

#Example
```
dependencies:
  graphql_generator:
    path: .\graphql-type-gen
dev_dependencies:
  build_runner: any
```

To use the package, annotate a method, variable, or a class as follows
```
@GQLGenerator(url: "GRAPHQL URL",
    headerToken: "BEARER TOKEN",
    namespace: "NAMESPACE",
    scalarType: Map<String,Type>)
```

#Example
```
@GQLGenerator(url: "https://turtle-api.herokuapp.com/graphql",
    headerToken: "Bearer asdf1234",
    namespace: "T",
    scalarType: {"Duration": bool, "ID": int})
```

Then open up your terminal in your project root and type the following:
```
flutter packages pub run build_runner build
```

This will generate a file with an extension `.graphql.dart`.

The generated file will contain all the model classes for the GraphQL URL.

* Make sure that there is a proper internet connection.

library graphql_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'graphql_generator.dart';

Builder generateGraphQLBuilder(BuilderOptions options) =>
    LibraryBuilder(GraphQLGenerators(),generatedExtension: '.graphql.dart');

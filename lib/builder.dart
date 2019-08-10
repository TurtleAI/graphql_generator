library graphql_generator;

import 'dart:io';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'graphql_generator.dart';

Builder generateGraphQLBuilder(BuilderOptions options){
    return LibraryBuilder(GraphQLGenerators(),generatedExtension: '.graphql.dart');
}
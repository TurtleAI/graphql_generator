class MutationClassGenerator {
  static final MutationClassGenerator _singleton =
      new MutationClassGenerator._internal();

  factory MutationClassGenerator() {
    return _singleton;
  }

  MutationClassGenerator._internal();
}

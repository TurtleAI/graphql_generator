class ObjectClassGenerator {
  static final ObjectClassGenerator _singleton =
      new ObjectClassGenerator._internal();

  factory ObjectClassGenerator() {
    return _singleton;
  }

  ObjectClassGenerator._internal();
}

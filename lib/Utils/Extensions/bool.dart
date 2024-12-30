extension BoolParsing on String {
  bool parseBool() => toLowerCase().trim() == 'true';
}

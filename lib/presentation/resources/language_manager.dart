// ignore_for_file: constant_identifier_names

const String ENGLISH = "en";

enum LanguageType {
  ENGLISH,
}

extension LanguageTypeExt on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
    }
  }
}

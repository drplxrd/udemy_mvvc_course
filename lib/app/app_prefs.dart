// ignore_for_file: prefer_final_fields

import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_mvvc_course/presentation/resources/language_manager.dart';

const String LANG_KEY = "PREFS_KEY_LANG";

class AppPreferences {
  SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(LANG_KEY);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }
}

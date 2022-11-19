import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'localisation.dart';

String getTranslated(BuildContext context, String key) {
  return DemoLocalizations.of(context).getTranslationValue(key)!;
}

const String English = 'en';
const String French = 'fr';

const String LANGUAGE_CODE = 'languageCode';

Future<Locale> setLocale(String langageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, langageCode);

  return _locale(langageCode);
}

Locale _locale(String langageCode) {
  Locale? _temp;
  switch (langageCode) {
    case English:
      _temp = Locale(langageCode, 'US');
      break;
    case French:
      _temp = Locale(langageCode, 'FR');
      break;
    default:
      _temp = Locale(English, 'FR');
  }
  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? French;
  return _locale(languageCode);
}

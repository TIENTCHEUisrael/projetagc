import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoLocalizations {
  final Locale locale;
  DemoLocalizations(this.locale);

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  }

  Map<String, String>? _localizedvalues;

  Future load() async {
    String jsonStringvalues = await rootBundle
        .loadString('lib/services/themes/lang/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringvalues);

    _localizedvalues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String? getTranslationValue(String key) {
    return _localizedvalues![key];
  }

  static const LocalizationsDelegate<DemoLocalizations> delegate =
      _DemoLocalizationDelegate();
}

class _DemoLocalizationDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const _DemoLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['fr', 'en'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) async {
    DemoLocalizations localizations = new DemoLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<DemoLocalizations> old) {
    return false;
  }
}

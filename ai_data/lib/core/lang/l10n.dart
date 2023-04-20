import 'package:flutter/material.dart';

class L10n {
  static final all = [
    englishLocale,
    spanishLocale,
    englishUSLocale,
  ];

  static Locale spanishLocale = const Locale('es', 'ES');
  static Locale englishLocale = const Locale('en', 'EN');
  static Locale englishUSLocale = const Locale('en', 'US');
}

extension L10nExtension on L10n {
  static Locale? getLocale(String localeName) {
    Locale? userLocale = L10n.all.firstWhere(
      (element) => element.languageCode == localeName,
      orElse: () => const Locale('en', 'US'),
    );

    return userLocale;
  }
}

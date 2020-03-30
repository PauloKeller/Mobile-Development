import "package:intl/intl.dart";
import "package:flutter/material.dart";

import 'messages_all.dart';


class I18n {
  static Future<I18n> load(Locale locale) {
    String name = locale.toString();
    final String countryCode = locale.countryCode;
    if (countryCode != null) {
      name =
      locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    }

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return I18n();
    });
  }

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }
}

  class I18nLocalizationsDelegate extends LocalizationsDelegate<I18n> {
  const I18nLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ["en", "zh", "pt"].contains(locale.languageCode);

  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);

  @override
  bool shouldReload(I18nLocalizationsDelegate old) => false;
}

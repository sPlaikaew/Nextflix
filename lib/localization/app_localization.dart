import 'package:flutter/material.dart';
import 'package:nextflix/localization/translations/translations.i69n.dart';
import 'package:nextflix/localization/translations/translations_th.i69n.dart';

const _supportedLocales = ['en','th'];

class AppLocalizations {
  const AppLocalizations(this.translations);

  final Translations translations;

  static final _translations = <String, Translations Function()>{
    'en': () => const Translations(),
    'th': () => const Translations_th(),
  };

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final List<Locale> supportedLocales =
      _supportedLocales.map((x) => Locale(x)).toList();

  static Future<AppLocalizations> load(Locale locale) =>
      Future.value(AppLocalizations(_translations[locale.languageCode]!()));

  static Translations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!
          .translations;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      _supportedLocales.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}

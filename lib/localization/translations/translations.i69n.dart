// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;

String get _languageCode => 'en';
String get _localeName => 'en';

String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class Translations implements i69n.I69nMessageBundle {
  const Translations();
  HomePageTranslations get homePage => HomePageTranslations(this);
  SearchPageTranslations get searchPage => SearchPageTranslations(this);
  DetailPageTranslations get detailPage => DetailPageTranslations(this);
  SelectProfilePageTranslations get selectProfilePage =>
      SelectProfilePageTranslations(this);
  SignInPageTranslations get signInPage => SignInPageTranslations(this);
  LanguageTranslations get language => LanguageTranslations(this);
  CommonTranslations get common => CommonTranslations(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'homePage':
        return homePage;
      case 'searchPage':
        return searchPage;
      case 'detailPage':
        return detailPage;
      case 'selectProfilePage':
        return selectProfilePage;
      case 'signInPage':
        return signInPage;
      case 'language':
        return language;
      case 'common':
        return common;
      default:
        return key;
    }
  }
}

class HomePageTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const HomePageTranslations(this._parent);
  String get trendingNow => "Trending Now";
  String get mustWatch => "Must-Watch";
  String get continueWatching => "Continue Watching for";
  String get onlyNextFlix => "Only on NETFLIX";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'trendingNow':
        return trendingNow;
      case 'mustWatch':
        return mustWatch;
      case 'continueWatching':
        return continueWatching;
      case 'onlyNextFlix':
        return onlyNextFlix;
      default:
        return key;
    }
  }
}

class SearchPageTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const SearchPageTranslations(this._parent);
  String get searchHint => "Search anime, movies, shows..";
  String get recommend => "Recommended Animes & Movies";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'searchHint':
        return searchHint;
      case 'recommend':
        return recommend;
      default:
        return key;
    }
  }
}

class DetailPageTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const DetailPageTranslations(this._parent);
  String get collection => "Collection";
  String get moreLikeThis => "More Like This";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'collection':
        return collection;
      case 'moreLikeThis':
        return moreLikeThis;
      default:
        return key;
    }
  }
}

class SelectProfilePageTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const SelectProfilePageTranslations(this._parent);
  String get whoWatch => "Who’s Watching?";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'whoWatch':
        return whoWatch;
      default:
        return key;
    }
  }
}

class SignInPageTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const SignInPageTranslations(this._parent);
  String get enterEmail => "Enter email";
  String get enterPassword => "Enter password";
  String get signIn => "Sign in";
  String get forgotPassword => "Forgot password?";
  String get noAccount => "Don’t have an account?";
  String get createOne => "Create one";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'enterEmail':
        return enterEmail;
      case 'enterPassword':
        return enterPassword;
      case 'signIn':
        return signIn;
      case 'forgotPassword':
        return forgotPassword;
      case 'noAccount':
        return noAccount;
      case 'createOne':
        return createOne;
      default:
        return key;
    }
  }
}

class LanguageTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const LanguageTranslations(this._parent);
  String get language => "Language";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'language':
        return language;
      default:
        return key;
    }
  }
}

class CommonTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const CommonTranslations(this._parent);
  String get home => "Home";
  String get coming => "Coming soon";
  String get search => "Search";
  String get downloads => "Downloads";
  String get menu => "Menu";
  String get refresh => "Refresh";
  String get play => "Play";
  String get myList => "My list";
  String get rate => "Rate";
  String get share => "Share";
  String get edit => "Edit";
  String get tryAgain => "Try again";
  String get save => "Save";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'home':
        return home;
      case 'coming':
        return coming;
      case 'search':
        return search;
      case 'downloads':
        return downloads;
      case 'menu':
        return menu;
      case 'refresh':
        return refresh;
      case 'play':
        return play;
      case 'myList':
        return myList;
      case 'rate':
        return rate;
      case 'share':
        return share;
      case 'edit':
        return edit;
      case 'tryAgain':
        return tryAgain;
      case 'save':
        return save;
      default:
        return key;
    }
  }
}

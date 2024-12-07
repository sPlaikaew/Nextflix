// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'translations.i69n.dart';

String get _languageCode => 'th';
String get _localeName => 'th';

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

class Translations_th extends Translations {
  const Translations_th();
  HomePageTranslations_th get homePage => HomePageTranslations_th(this);
  SearchPageTranslations_th get searchPage => SearchPageTranslations_th(this);
  DetailPageTranslations_th get detailPage => DetailPageTranslations_th(this);
  SelectProfilePageTranslations_th get selectProfilePage =>
      SelectProfilePageTranslations_th(this);
  SignInPageTranslations_th get signInPage => SignInPageTranslations_th(this);
  LanguageTranslations_th get language => LanguageTranslations_th(this);
  CommonTranslations_th get common => CommonTranslations_th(this);
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
        return super[key];
    }
  }
}

class HomePageTranslations_th extends HomePageTranslations {
  final Translations_th _parent;
  const HomePageTranslations_th(this._parent) : super(_parent);
  String get trendingNow => "มาแรง";
  String get mustWatch => "ต้องดู";
  String get continueWatching => "รับชมต่อ";
  String get onlyNextFlix => "เฉพาะที่เน็ตฟลิกซ์";
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
        return super[key];
    }
  }
}

class SearchPageTranslations_th extends SearchPageTranslations {
  final Translations_th _parent;
  const SearchPageTranslations_th(this._parent) : super(_parent);
  String get searchHint => "ค้นหา อนิเมะ, หนัง, อื่นๆ..";
  String get recommend => "หนังและอนิเมะแนะนำ";
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
        return super[key];
    }
  }
}

class DetailPageTranslations_th extends DetailPageTranslations {
  final Translations_th _parent;
  const DetailPageTranslations_th(this._parent) : super(_parent);
  String get collection => "คอลเลคชั่น";
  String get moreLikeThis => "ที่คล้ายกัน";
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
        return super[key];
    }
  }
}

class SelectProfilePageTranslations_th extends SelectProfilePageTranslations {
  final Translations_th _parent;
  const SelectProfilePageTranslations_th(this._parent) : super(_parent);
  String get whoWatch => "ใครกำลังดู ?";
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
        return super[key];
    }
  }
}

class SignInPageTranslations_th extends SignInPageTranslations {
  final Translations_th _parent;
  const SignInPageTranslations_th(this._parent) : super(_parent);
  String get enterEmail => "กรอกอีเมล";
  String get enterPassword => "กรอกรหัสผ่าน";
  String get signIn => "เข้าสู่ระบบ";
  String get forgotPassword => "ลืมรหัสผ่าน?";
  String get noAccount => "ยังไม่มีบัญชี?";
  String get createOne => "สร้างใหม่";
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
        return super[key];
    }
  }
}

class LanguageTranslations_th extends LanguageTranslations {
  final Translations_th _parent;
  const LanguageTranslations_th(this._parent) : super(_parent);
  String get language => "ภาษา";
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
        return super[key];
    }
  }
}

class CommonTranslations_th extends CommonTranslations {
  final Translations_th _parent;
  const CommonTranslations_th(this._parent) : super(_parent);
  String get home => "หน้าแรก";
  String get coming => "กำลังมา";
  String get search => "ค้นหา";
  String get downloads => "ดาวน์โหลด";
  String get menu => "เมนู";
  String get refresh => "รีเฟรช";
  String get play => "เล่น";
  String get myList => "รายการของฉัน";
  String get rate => "เรท";
  String get share => "แชร์";
  String get edit => "แก้ไข";
  String get tryAgain => "ลองอีกครั้ง";
  String get save => "บันทึก";
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
        return super[key];
    }
  }
}

import 'dart:collection';

import 'package:counting_love_day/app/services/language/translate_vi_vn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  // static final locale = _getLocaleFromLanguage();

  static const fallbackLocale = Locale('en', 'US');

  static final langCodes = [
    'en',
    'vi',
  ];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
  ];

  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
  });

  static Locale changeLocale(String language) {
    final locale = _getLocaleFromLanguage(language);
    Get.updateLocale(locale);
    return locale;
  }

  @override
  Map<String, Map<String, String>> get keys => {'en_US': en, 'vi_VN': vi};

  static Locale _getLocaleFromLanguage(String language) {
    if (language == "vi") {
      return locales[1];
    } else {
      return locales[0];
    }
  }
}

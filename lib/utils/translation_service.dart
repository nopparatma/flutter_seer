import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class TranslationService extends Translations {
  static Map<String, String>? en;
  static Map<String, String>? th;

  static Future<void> loadTranslations() async {
    en = await _loadJson('assets/lang/en.json');
    th = await _loadJson('assets/lang/th.json');
  }

  static Future<Map<String, String>> _loadJson(String path) async {
    final data = await rootBundle.loadString(path);
    return Map<String, String>.from(json.decode(data));
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en!,
        'th_TH': th!,
      };
}

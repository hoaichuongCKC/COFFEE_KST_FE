// ignore_for_file: constant_identifier_names

import 'package:coffee_kst/database/hive/settings/language.dart';
import 'package:coffee_kst/database/hive/settings/theme.dart';
import 'package:hive/hive.dart';

//name box
const String NAME_BOX_LANGUAGE = "language";
const String NAME_BOX_THEME = "theme";

//key name
const String KEY_BOX_THEME = 'theme_data';
const String KEY_BOX_LANGUAGE = 'language_data';

class BoxesSettings {
  static BoxesSettings instance = BoxesSettings();

  static Future<Box<ThemeHive>> openBoxTheme() async =>
      await Hive.openBox<ThemeHive>(NAME_BOX_THEME);
  static Future<Box<LanguageHive>> openBoxLanguage() async =>
      await Hive.openBox<LanguageHive>(NAME_BOX_LANGUAGE);
  void initialSettings() async {
    var boxTheme = await openBoxTheme();
    var boxLanguage = await openBoxLanguage();
    if (!boxTheme.containsKey(KEY_BOX_THEME)) {
      boxTheme.put(KEY_BOX_THEME, ThemeHive(isDarkTheme: false));
    }
    if (!boxLanguage.containsKey(KEY_BOX_LANGUAGE)) {
      boxLanguage.put(
          KEY_BOX_LANGUAGE, LanguageHive(isLanguageVietNamese: true));
    }
  }
}

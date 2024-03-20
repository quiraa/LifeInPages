import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static const String themeKey = 'theme_key';

  static Future<void> setTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(themeKey, value);
  }

  static Future<bool?> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeKey);
  }
}

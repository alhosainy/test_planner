
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  static const String _kLocaleKey = 'locale';

  static Future<void> setLocale(String locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLocaleKey, locale);
  }

  static Future<String?> getLocaleString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kLocaleKey);
  }
}
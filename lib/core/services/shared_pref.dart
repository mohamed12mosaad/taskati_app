import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  static late SharedPreferences _prefs;
  static String namekey = 'name';
  static String imagekey = 'image';
  static String isUploadedKey = 'isLogin';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setUserData(String name, String image) async {
    await setString(namekey, name);
    await setString(imagekey, image);
  }

  static Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  static bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }
}

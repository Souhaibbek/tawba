import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences?> init() async {
    if (_prefs != null) {
      return _prefs;
    } else {
      _prefs = await SharedPreferences.getInstance();
      return _prefs;
    }
  }

  static Future<bool> saveInt({
    required String key,
    required int value,
  }) async {
    SharedPreferences? prefs = await init();
    return prefs!.setInt(key, value);
  }

  static Future<bool> saveBool({
    required String key,
    required bool value,
  }) async {
    SharedPreferences? prefs = await init();
    return prefs!.setBool(key, value);
  }

  static Future<bool> saveString({
    required String key,
    required String value,
  }) async {
    SharedPreferences? prefs = await init();
    return prefs!.setString(key, value);
  }

  static Future<bool> saveDouble({
    required String key,
    required double value,
  }) async {
    SharedPreferences? prefs = await init();
    return prefs!.setDouble(key, value);
  }

  static Future<String?> getString({
    required String key,
  }) async {
    SharedPreferences? prefs = await init();
    return prefs?.getString(key);
  }

  static Future<int?> getInt({
    required String key,
  }) async {
    SharedPreferences? prefs = await init();
    return prefs?.getInt(key);
  }

  static Future<double?> getDouble({
    required String key,
  }) async {
    SharedPreferences? prefs = await init();
    return prefs?.getDouble(key);
  }

  static Future<bool?> getBool({
    required String key,
  }) async {
    SharedPreferences? prefs = await init();
    return prefs?.getBool(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    SharedPreferences? prefs = await init();
    return prefs!.remove(key);
  }

  static Future<bool> clearData() async {
    SharedPreferences? prefs = await init();
    return prefs!.clear();
  }
}

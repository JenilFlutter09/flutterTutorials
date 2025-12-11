import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
/// Local Storage
class SharedPrefHelper {
  SharedPrefHelper._(); // Private constructor
  static final SharedPrefHelper instance = SharedPrefHelper._();

  Future<SharedPreferences> get _prefs async => await SharedPreferences.getInstance();

  // Save String
  Future<void> setString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  // Save Bool
  Future<void> setBool(String key, bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(key);
  }

  // Save Int
  Future<void> setInt(String key, int value) async {
    final prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(key);
  }

  // Save Double
  Future<void> setDouble(String key, double value) async {
    final prefs = await _prefs;
    await prefs.setDouble(key, value);
  }

  Future<double?> getDouble(String key) async {
    final prefs = await _prefs;
    return prefs.getDouble(key);
  }

  // Save List<String>
  Future<void> setStringList(String key, List<String> value) async {
    final prefs = await _prefs;
    await prefs.setStringList(key, value);
  }

  Future<List<String>?> getStringList(String key) async {
    final prefs = await _prefs;
    return prefs.getStringList(key);
  }

  // Save Map / Object using JSON
  Future<void> setMap(String key, Map<String, dynamic> map) async {
    final prefs = await _prefs;
    await prefs.setString(key, jsonEncode(map));
  }

  Future<Map<String, dynamic>?> getMap(String key) async {
    final prefs = await _prefs;
    final jsonStr = prefs.getString(key);
    if (jsonStr == null) return null;
    return jsonDecode(jsonStr);
  }

  // Remove a key
  Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  // Clear all
  Future<void> clear() async {
    final prefs = await _prefs;
    await prefs.clear();
  }
}

class sharedHelper {
  Future<SharedPreferences> get pref  async => await SharedPreferences.getInstance();
  static String p_id = 'productId';

  Future<void> setInt(int data) async {
    final preference = await pref;
    preference.setInt(p_id, data);
  }
  Future<int?> getInt() async{
    final preference = await pref;
    return preference.getInt(p_id);
  }
}
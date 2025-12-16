import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'apiExample/model/productModel.dart';
/// Token
class SecureStorageHelper {
  SecureStorageHelper._();
  //static final SecureStorageHelper instance = SecureStorageHelper._();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Save String
  Future<void> setString(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> getString(String key) async {
    return await _storage.read(key: key);
  }

  // Save Bool
  Future<void> setBool(String key, bool value) async {
    await _storage.write(key: key, value: value.toString());
  }

  Future<bool?> getBool(String key) async {
    final val = await _storage.read(key: key);
    return val == null ? null : val.toLowerCase() == 'true';
  }

  // Save Int
  Future<void> setInt(String key, int value) async {
    await _storage.write(key: key, value: value.toString());
  }

  Future<int?> getInt(String key) async {
    final val = await _storage.read(key: key);
    return val == null ? null : int.tryParse(val);
  }

  // Save List<String>
  Future<void> setStringList(String key, List<String> list) async {
    await _storage.write(key: key, value: jsonEncode(list));
  }

  Future<List<String>?> getStringList(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) return null;
    return List<String>.from(jsonDecode(value));
  }

  // Save Map / Object
  Future<void> setMap(String key, Map<String, dynamic> map) async {
    await _storage.write(key: key, value: jsonEncode(map));
  }

  Future<Map<String, dynamic>?> getMap(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) return null;
    return jsonDecode(value);
  }

  // Remove a key
  Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }

  // Clear all secure data
  Future<void> clear() async {
    await _storage.deleteAll();
  }
}

class secureStorageHelp{

  final FlutterSecureStorage sinstance = const FlutterSecureStorage();
  static String tokenKey = 'token';

  /// Encode will convert Object to String
  Future<void> setToken(Products value) async {
    var data = jsonEncode(value);
    await sinstance.write(key: tokenKey, value: data);
  }
  /// Decode will convert String to Object
  Future<Products?> getToken () async {
    var data = await sinstance.read(key: tokenKey);
    return jsonDecode(data!);
  }

  Future<void> deleteToken() async {
   // await sinstance.delete(key: tokenKey);
    await sinstance.deleteAll();
  }

}


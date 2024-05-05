import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../repository/model/response/login_response.dart';

class AppPreferences {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  String userData = "user_data";
  String token = "token";

  Future<void> writeSecureData(String key, String value) {
    print('writing for data from key $key');

    var writeData = storage.write(key: key, value: value);
    return writeData;
  }

  Future<String?> readSecureData(String key) {
    print('asking for data from key $key');

    var readData = storage.read(key: key);
    return readData;
  }

  Future<void> deleteSecureData(String key) {
    print('deleting for data from key $key');

    var deleteData = storage.delete(key: key);
    return deleteData;
  }

  /// --------------------------------------------------------------------------
  /// User Data got from login, used to save user profile
  /// --------------------------------------------------------------------------

  Future<void> setUser(User value) async {
    var writeData =
    await storage.write(key: userData, value: jsonEncode(value));
    return writeData;
  }

  Future<User?> getUser() async {
    var readData = await storage.read(key: userData);

    if (readData == null) return null;

    var result = User.fromJson(jsonDecode(readData));
    return result;
  }

  Future<void> deleteUser() {
    var deleteData = storage.delete(key: userData);
    return deleteData;
  }
}
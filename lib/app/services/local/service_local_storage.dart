// ignore_for_file: unused_field

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;

  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> saveData(String key, String value) async {
    await _sharedPreferences?.setString(key, value);
  }

  String? getData(String key) {
    return _sharedPreferences?.getString(key);
  }

  Future<void> deleteData(String key) async {
    await _sharedPreferences?.remove(key);
  }
}

// ignore_for_file: unused_field

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Key {
  user,
}

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;

  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

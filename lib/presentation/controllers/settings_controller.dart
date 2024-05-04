import 'package:counting_love_day/domain/usecases/setting_usecase.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  final SettingUsecaseImpl _settingUsecaseImpl = Get.find(tag: 'setting');

  Future<String?> getDataLanguage() async {
    return _settingUsecaseImpl.getDataLanguage();
  }

  Future<void> saveDataLanguage(String language) async {
    return _settingUsecaseImpl.saveDataLanguage(language);
  }
}

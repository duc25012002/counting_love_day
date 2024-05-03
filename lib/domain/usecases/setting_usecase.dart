import 'package:get/get.dart';

import '../../data/repositories/local_datasource_impl.dart';

abstract class SettingUsecase {
  Future<dynamic> getDataLanguage();
  Future<dynamic> saveDataLanguage(String language);
}

class SettingUsecaseImpl implements SettingUsecase {
  final LocalDataSourceImpl _localDataSourceImpl = Get.find(tag: "user_local");
  @override
  Future<String?> getDataLanguage() async {
    return await _localDataSourceImpl.getDataLanguage();
  }

  @override
  Future saveDataLanguage(String language) async {
    return await _localDataSourceImpl.saveDataLanguage(language);
  }
}

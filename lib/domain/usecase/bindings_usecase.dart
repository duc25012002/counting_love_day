import 'package:counting_love_day/domain/usecase/couple_usecase.dart';
import 'package:counting_love_day/domain/usecase/setting_usecase.dart';
import 'package:counting_love_day/domain/usecase/user_usecase.dart';
import 'package:get/get.dart';

class BindingsUsecase extends Bindings {
  @override
  void dependencies() {
    Get.put(UserUsecaseImpl(), tag: "auth");
    Get.put(CoupleUseCaseImpl(), tag: "couple");
    Get.put(SettingUsecaseImpl(), tag: "setting");
  }
}

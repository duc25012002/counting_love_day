import 'package:counting_love_day/domain/usecases/couple_usecase.dart';
import 'package:counting_love_day/domain/usecases/setting_usecase.dart';
import 'package:counting_love_day/domain/usecases/user_usecase.dart';
import 'package:get/get.dart';

class BindingsUsecase extends Bindings {
  @override
  void dependencies() {
    Get.put(UserUsecaseImpl(), tag: "auth");
    Get.put(CoupleUseCaseImpl(), tag: "couple");
    Get.put(SettingUsecaseImpl(), tag: "setting");
  }
}

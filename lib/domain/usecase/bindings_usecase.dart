import 'package:counting_love_day/domain/usecase/user_usecase.dart';
import 'package:get/get.dart';

class BindingsUsecase extends Bindings {
  @override
  void dependencies() {
    Get.put(UserUsecaseImpl(), tag: "user_login");
  }
}

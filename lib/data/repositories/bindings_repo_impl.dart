import 'package:counting_love_day/data/repositories/user_repository_impl.dart';
import 'package:get/get.dart';

class BindingsRepositoryImpl extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepositoryImpl(), tag: "user_login");
  }
}

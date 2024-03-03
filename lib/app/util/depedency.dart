import 'package:counting_love_day/presentation/controllers/auth_controller.dart';
import 'package:get/get.dart';

class ManageDependencies extends Bindings {
  @override
  void dependencies() async {
    _initNonAsync();
  }

  void _initNonAsync() {
    Get.lazyPut(
        tag: "auth_controller",
        () => AuthController(),
        fenix: true);
  }
}

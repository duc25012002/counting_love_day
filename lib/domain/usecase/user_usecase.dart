import 'package:counting_love_day/data/repositories/user_repository_impl.dart';
import 'package:get/get.dart';

abstract class UserUsecase {
  Future<void> userLogin({required String email, required String password});
}

class UserUsecaseImpl implements UserUsecase {
  final UserRepositoryImpl userRepository = Get.find(tag: "user_login");

  @override
  Future<dynamic> userLogin(
      {required String email, required String password}) async {
    return userRepository.userLogin(email: email, password: password);
  }
}

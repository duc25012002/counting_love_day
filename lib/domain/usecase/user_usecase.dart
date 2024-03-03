import 'package:counting_love_day/data/repositories/user_repository_impl.dart';
import 'package:get/get.dart';

abstract class UserUsecase {
  Future<void> userLogin({required String email, required String password});
  Future<void> userRegister({
    required String email,
    required String userName,
    required String password,
    required String passwordConfirmation,
  });
  Future<void> checkEmail({required String email});
}

class UserUsecaseImpl implements UserUsecase {
  final UserRepositoryImpl userRepository = Get.find(tag: "user_login");

  @override
  Future<dynamic> userLogin(
      {required String email, required String password}) async {
    return userRepository.userLogin(email: email, password: password);
  }

  @override
  Future<dynamic> userRegister({
    required String email,
    required String userName,
    required String password,
    required String passwordConfirmation,
  }) {
    return userRepository.userRegister(
      email: email,
      password: password,
      userName: userName,
      passwordConfirmation: passwordConfirmation,
    );
  }

  @override
  Future<dynamic> checkEmail({required String email}) {
    return userRepository.checkEmail(email: email);
  }
}

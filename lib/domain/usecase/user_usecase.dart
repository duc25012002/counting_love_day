import 'package:counting_love_day/app/services/log.dart';
import 'package:counting_love_day/data/repositories/local_datasource_impl.dart';
import 'package:counting_love_day/data/repositories/user_repository_impl.dart';
import 'package:get/get.dart';

abstract class UserUsecase {
  // features
  Future<void> userLogin({required String email, required String password});
  Future<void> checkEmail({required String email});
  Future<void> verifyUserEmail({required String email, required String code});
  Future<void> resentOtp({required String email});
  Future<void> userRegister({
    required String email,
    required String userName,
    required String password,
    required String passwordConfirmation,
  });

  // local
  Future<void> saveUserEmail(String email);
  Future<dynamic> getUserEmail();

  Future<dynamic> getUserToken();
}

class UserUsecaseImpl implements UserUsecase {
  final UserRepositoryImpl userRepository = Get.find(tag: "auth");
  final LocalDataSourceImpl _localDataSourceImpl = Get.find(tag: "user_local");

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

  @override
  Future<dynamic> getUserEmail() async {
    return await _localDataSourceImpl.getUserEmail();
  }

  @override
  Future<void> saveUserEmail(String email) {
    return _localDataSourceImpl.saveUserEmail(email);
  }

  @override
  Future<dynamic> getUserToken() async {
    return await _localDataSourceImpl.getToken();
  }

  @override
  Future<dynamic> verifyUserEmail(
      {required String email, required String code}) {
    return userRepository.verifyUserEmail(email: email, code: code);
  }

  @override
  Future resentOtp({required String email}) {
    return userRepository.resendOtp(email: email);
  }
}

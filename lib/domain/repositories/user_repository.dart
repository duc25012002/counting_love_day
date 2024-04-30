abstract class UserRepository {
  Future<void> userLogin({required String email, required String password});
  Future<void> checkEmail({required String email});
  Future<void> userRegister({
    required String email,
    required String userName,
    required String password,
    required String passwordConfirmation,
  });
  Future<void> verifyUserEmail({required String email, required String code});
  Future<void> resendOtp({required String email});
  
}

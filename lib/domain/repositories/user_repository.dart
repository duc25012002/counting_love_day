abstract class UserRepository {
  Future<void> userLogin({required String email, required String password});
  Future<void> checkEmail({required String email});
  Future<void> userRegister({
    required String email,
    required String userName,
    required String password,
    required String passwordConfirmation,
  });
}

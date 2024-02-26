abstract class UserRepository {
  Future<void> userLogin({required String email, required String password});
}

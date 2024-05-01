abstract class CoupleRepository {
  Future<void> checkCouple({required String token});
  Future<void> getListRequest({required String token});
  Future<void> sendRequestInvite({
    required String token,
    required String email,
  });
}

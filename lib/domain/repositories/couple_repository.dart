abstract class CoupleRepository {
  Future<void> checkCouple({required String token});
  Future<void> getListRequest({required String token});
}

import 'package:counting_love_day/data/repositories/couple_repository_impl.dart';
import 'package:get/get.dart';

abstract class CoupleUseCase {
  Future<void> checkCouple({required String token});
  Future<dynamic> getListRequest({required String token});
}

class CoupleUseCaseImpl implements CoupleUseCase {
  final CoupleRepositoryImpl coupleRepositoryImpl = Get.find(tag: "couple");

  @override
  Future<dynamic> checkCouple({required String token}) {
    return coupleRepositoryImpl.checkCouple(token: token);
  }

  @override
  Future<dynamic> getListRequest({required String token}) {
    return coupleRepositoryImpl.getListRequest(token: token);
  }
}

import 'package:counting_love_day/data/repositories/couple_repository_impl.dart';
import 'package:counting_love_day/data/repositories/user_repository_impl.dart';
import 'package:get/get.dart';

import '../local_datasource_impl.dart';

class BindingsRepositoryImpl extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepositoryImpl(), tag: "auth");
    Get.lazyPut(() => LocalDataSourceImpl(), tag: "user_local");
    Get.lazyPut(() => CoupleRepositoryImpl(), tag: "couple");
  }
}

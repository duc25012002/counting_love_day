import 'package:counting_love_day/app/services/log.dart';
import 'package:counting_love_day/domain/usecase/couple_usecase.dart';
import 'package:counting_love_day/domain/usecase/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CoupleUseCaseImpl _coupleUseCaseImpl = Get.find(tag: "couple");
  final UserUsecaseImpl _userUsecaseImpl = Get.find(tag: "auth");

  TextEditingController email = TextEditingController();
  RxBool isFocus = false.obs;
  RxString userToken = "".obs;
  RxInt reponseCode = 10.obs;

  withCheckCouple() async {
    try {
      userToken.value = await _userUsecaseImpl.getUserToken();
      String code =
          await _coupleUseCaseImpl.checkCouple(token: userToken.value);
      log.d("Data check Couple:: ${int.tryParse(code)}");
      reponseCode.value = int.tryParse(code)!;
    } catch (exception) {
      print(exception.toString());
    }
  }
}

import 'package:counting_love_day/app/util/util_log.dart';
import 'package:counting_love_day/data/models/request_couple_model.dart';
import 'package:counting_love_day/domain/usecases/couple_usecase.dart';
import 'package:counting_love_day/domain/usecases/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CoupleUseCaseImpl _coupleUseCaseImpl = Get.find(tag: "couple");
  final UserUsecaseImpl _userUsecaseImpl = Get.find(tag: "auth");

  TextEditingController email = TextEditingController();
  RxBool isFocus = false.obs;
  RxString userToken = "".obs;
  RxInt reponseCode = 10.obs;
  RxInt checkCouple = 0.obs;

  List<RequestCoupleModel> listRequest = [];

  // Future<String?> getDataLanguage() async {
  //   return _userUsecaseImpl.getDataLanguage();
  // }

  // Future<void> saveDataLanguage(String language) async {
  //   return _userUsecaseImpl.saveDataLanguage(language);
  // }

  withCheckCouple() async {
    try {
      userToken.value = await _userUsecaseImpl.getUserToken();
      int code = await _coupleUseCaseImpl.checkCouple(token: userToken.value);
      log.d(code);
      checkCouple.value = code;
    } catch (exception) {
      print(exception.toString());
    }
  }

  withGetListRequest() async {
    try {
      userToken.value = await _userUsecaseImpl.getUserToken();
      listRequest =
          await _coupleUseCaseImpl.getListRequest(token: userToken.value);
    } catch (exception) {
      print(exception.toString());
    }
  }

  withSendRequest() async {
    try {
      userToken.value = await _userUsecaseImpl.getUserToken();
      int code = await _coupleUseCaseImpl.sendRequestInvite(
        token: userToken.value,
        email: email.text,
      );
      reponseCode.value = code;
    } catch (exception) {
      print(exception.toString());
    }
  }
}

import 'package:counting_love_day/domain/usecases/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/util/util_log.dart';

class AuthController extends GetxController {
  final UserUsecaseImpl _userUsecaseImpl = Get.find(tag: "auth");
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  TextEditingController pinController = TextEditingController();

  FocusNode? focusNode;
  RxBool isFocus = false.obs;
  RxBool nextPage = false.obs;
  RxInt reponseCode = 10.obs;
  RxInt current = 0.obs;
  RxString pinValue = "".obs;
  RxString userEmail = "".obs;
  RxInt countdown = 30.obs;
  RxBool isActiveButton = true.obs;

  @override
  void onInit() {
    super.onInit();
    focusNode?.addListener(() {
      isFocus.value = focusNode!.hasFocus;
    });
    withGetUserEmail();
  }

  withLogin() async {
    if (userName.text.isNotEmpty && password.text.isNotEmpty) {
      await _userUsecaseImpl.saveUserEmail(userName.text);
      try {
        String code = await _userUsecaseImpl.userLogin(
          email: userName.text,
          password: password.text,
        );
        reponseCode.value = int.tryParse(code)!;
      } catch (exception) {
        print(exception.toString());
      }
    } else {}
  }

  withRegister() async {
    if (email.text.isNotEmpty && userName.text.isNotEmpty) {
      try {
        String code = await _userUsecaseImpl.userRegister(
          email: email.text,
          password: password.text,
          passwordConfirmation: passwordConfirm.text,
          userName: userName.text,
        );
        reponseCode.value = int.tryParse(code)!;
      } catch (exception) {
        print(exception.toString());
      }
    }
  }

  withCheckMail() async {
    if (email.text.isNotEmpty) {
      try {
        String code = await _userUsecaseImpl.checkEmail(email: email.text);
        await _userUsecaseImpl.saveUserEmail(email.text);
        log.i(
          "DATA LOCAL:: ${await _userUsecaseImpl.getUserEmail()}",
        );
        reponseCode.value = int.tryParse(code)!;
      } catch (exception) {
        print(exception.toString());
      }
    }
  }

  withGetUserEmail() async {
    try {
      userEmail.value = await _userUsecaseImpl.getUserEmail();
      log.i("[Local response]: $userEmail");
    } catch (exception) {
      print(exception.toString());
    }
  }

  withVerifyUserEmail() async {
    try {
      userEmail.value = await _userUsecaseImpl.getUserEmail();
      String code = await _userUsecaseImpl.verifyUserEmail(
          email: userEmail.value, code: pinValue.value);
      print(int.tryParse(code));
      reponseCode.value = int.tryParse(code)!;
    } catch (exception) {
      print(exception.toString());
    }
  }

  withResentOtp() async {
    try {
      userEmail.value = await _userUsecaseImpl.getUserEmail();
      String code = await _userUsecaseImpl.resentOtp(email: userEmail.value);
      log.d(int.tryParse(code));
      reponseCode.value = int.tryParse(code)!;
    } catch (exception) {
      print(exception.toString());
    }
  }

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    email.dispose();
    passwordConfirm.dispose();
    focusNode?.dispose();
    super.dispose();
  }
}

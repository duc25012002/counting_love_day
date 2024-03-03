import 'package:counting_love_day/domain/usecase/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final UserUsecaseImpl _userUsecaseImpl = Get.find(tag: "user_login");
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  FocusNode? focusNode;
  RxBool isFocus = false.obs;
  RxBool nextPage = false.obs;
  RxInt current = 0.obs;

  @override
  void onInit() {
    super.onInit();
    focusNode?.addListener(() {
      isFocus.value = focusNode!.hasFocus;
    });
  }

  withLogin() async {
    if (userName.text.isNotEmpty && password.text.isNotEmpty) {
      try {
        String code = await _userUsecaseImpl.userLogin(
          email: userName.text,
          password: password.text,
        );
        return int.tryParse(code);
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
        return int.tryParse(code);
      } catch (exception) {
        print(exception.toString());
      }
    }
  }

  withCheckMail() async {
    if (email.text.isNotEmpty) {
      try {
        String code = await _userUsecaseImpl.checkEmail(email: email.text);
        return int.tryParse(code);
      } catch (exception) {
        print(exception.toString());
      }
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

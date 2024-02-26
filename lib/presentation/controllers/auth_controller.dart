import 'package:counting_love_day/domain/usecase/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  RxBool isFocus1 = false.obs;
  RxBool isFocus2 = false.obs;
  final UserUsecaseImpl _userUsecaseImpl;

  AuthController(this._userUsecaseImpl);

  @override
  void onInit() {
    super.onInit();
    focusNode1.addListener(() {
      isFocus1.value = focusNode1.hasFocus;
    });
    focusNode2.addListener(() {
      isFocus2.value = focusNode2.hasFocus;
    });
  }

  withLogin() async {
    if (userName.text.isNotEmpty && password.text.isNotEmpty) {
      try {
        String code = await _userUsecaseImpl.userLogin(
            email: userName.text, password: password.text);

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
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }
}

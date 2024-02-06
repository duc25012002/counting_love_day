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

  withLogin() {}

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    focusNode2.dispose();
    super.dispose();
  }
}

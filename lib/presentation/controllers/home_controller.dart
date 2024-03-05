import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController email = TextEditingController();
  RxBool isFocus = false.obs;
}

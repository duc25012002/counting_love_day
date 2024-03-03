// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:counting_love_day/app/configs/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Input(
  TextEditingController? _textEditingController,
  String? _label,
  RxBool? isFocus,
  TextInputType? keyboardType,
  String? Function(String?)? validate,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      controller: _textEditingController,
      validator: validate,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: _label,
        labelStyle: TextStyle(
            color: isFocus == true ? AppColor.primary : Colors.black38),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
      ),
    ),
  );
}

// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:counting_love_day/app/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextFormField Input(TextEditingController _textEditingController,
    FocusNode _focus, var _controller, String _label, RxBool isFocus) {
  return TextFormField(
    controller: _textEditingController,
    focusNode: _focus,
    decoration: InputDecoration(
      labelText: _label,
      labelStyle:
          TextStyle(color: isFocus == true ? AppColor.primary : Colors.black38),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.primary),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.primary),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    ),
  );
}

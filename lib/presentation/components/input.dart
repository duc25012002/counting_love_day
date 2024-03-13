// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:counting_love_day/app/configs/app_color.dart';
import 'package:counting_love_day/app/configs/reponsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Input(TextEditingController? _textEditingController, String? _label,
    RxBool? isFocus, TextInputType? keyboardType,
    {double radius = 0,
    String? Function(String?)? validate,
    Widget? suffix,
    bool boder = true,
    bool hintText = false,
    bool? shadow = true}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Reponsive.fontSize * 3),
    child: Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: shadow == true ? Colors.white : null,
        borderRadius: BorderRadius.circular(60),
        boxShadow: [
          if (shadow == true)
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: TextFormField(
        controller: _textEditingController,
        validator: validate,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: hintText == false ? _label : null,
          hintText: hintText == true ? _label : null,
          hintStyle: hintText == true ? const TextStyle(fontSize: 13) : null,
          labelStyle: TextStyle(
            color: isFocus == true ? AppColor.primary : Colors.black38,
          ),
          border: boder == true
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary),
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius == 0 ? 5 : radius),
                  ),
                )
              : InputBorder.none,
          suffixIcon: suffix,
          contentPadding: EdgeInsets.fromLTRB(Reponsive.fontSize * 5,
              Reponsive.fontSize * 5, Reponsive.fontSize * 5, 0),
          focusedBorder: boder == true
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary),
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius == 0 ? 5 : radius),
                  ),
                )
              : InputBorder.none,
        ),
      ),
    ),
  );
}

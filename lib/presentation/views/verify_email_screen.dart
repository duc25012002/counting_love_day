// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:counting_love_day/app/configs/app_color.dart';
import 'package:counting_love_day/app/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../app/configs/reponsive.dart';
import '../controllers/auth_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Reponsive().setSize(context);
    AuthController _controller = Get.find(tag: "auth_controller");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sắp xong rồi !",
                    style: TextStyle(
                        fontSize: Reponsive.fontSize * 10,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: Reponsive.height * 0.05),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text:
                              "Vui lòng nhập mã gồm 6 chữ số được gửi tới email ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: _controller.userEmail.value,
                          style: TextStyle(color: AppColor.secondary),
                        ),
                        const TextSpan(
                          text: " để xác minh.",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: Reponsive.height * 0.05),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Pinput(
                      length: 6,
                      keyboardType: TextInputType.number,
                      onCompleted: (pin) {
                        _controller.pinValue.value = pin;
                      },
                    ),
                  ),
                  SizedBox(height: Reponsive.height * 0.05),
                  Container(
                    width: Reponsive.width,
                    height: Reponsive.height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        await _controller.withVerifyUserEmail();
                        if (_controller.reponseCode.value == 0) {
                          Fluttertoast.showToast(msg: "Xác thực thành công.");
                          Get.toNamed(Routes.loginScreen);
                        } else if (_controller.reponseCode.value == 1) {
                          Fluttertoast.showToast(msg: "Email không tồn tại.");
                        } else if (_controller.reponseCode.value == 2) {
                          Fluttertoast.showToast(msg: "OTP không tồn tại.");
                        } else if (_controller.reponseCode.value == 3) {
                          Fluttertoast.showToast(msg: "OTP đã hết hạn.");
                        } else if (_controller.reponseCode.value == 4) {
                          Fluttertoast.showToast(msg: "Sai OTP.");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.secondary,
                      ),
                      child: Text(
                        "Xác minh",
                        style: TextStyle(fontSize: Reponsive.fontSize * 6),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

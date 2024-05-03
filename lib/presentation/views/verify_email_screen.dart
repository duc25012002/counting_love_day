// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element, unrelated_type_equality_checks

import 'dart:async';

import 'package:counting_love_day/app/configs/config_app_color.dart';
import 'package:counting_love_day/app/configs/config_responsive.dart';
import 'package:counting_love_day/app/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../controllers/auth_controller.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final AuthController _controller = Get.find(tag: "auth_controller");
  late Timer timer;

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_controller.countdown.value > 0) {
          _controller.countdown.value--;
        } else {
          _controller.countdown.value = 30;
          _controller.isActiveButton.value = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive.setSize(context);

    @override
    void initState() {
      super.initState();
      startTimer();
    }

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
                        fontSize: Responsive.fontSize * 10,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: Responsive.height * 0.05),
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
              SizedBox(height: Responsive.height * 0.05),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  SizedBox(height: Responsive.height * 0.05),
                  buttonAccept(_controller, startTimer),
                  SizedBox(height: Responsive.height * 0.05),
                  resetOtp(_controller),
                  SizedBox(height: Responsive.height * 0.02),
                  timeRequest(_controller)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buttonAccept(
      AuthController _controller, void Function() startTimer) {
    return Container(
      width: Responsive.width,
      height: Responsive.height * 0.06,
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
          style: TextStyle(fontSize: Responsive.fontSize * 6),
        ),
      ),
    );
  }

  Obx timeRequest(AuthController _controller) {
    return Obx(
      () => RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: "Request new code in ",
              style: TextStyle(
                color: Colors.black38,
              ),
            ),
            TextSpan(
              text: "${_controller.countdown.value}s",
              style: const TextStyle(
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell resetOtp(dynamic _controller) {
    return InkWell(
      onTap: () async {
        _controller.withResentOtp();
        _controller.isActiveButton.value = false;
        startTimer();
        if (_controller.reponseCode.value == 0) {
          Fluttertoast.showToast(msg: "Gửi lại OTP thành công.");
        } else if (_controller.reponseCode.value == 2) {
          Fluttertoast.showToast(msg: "Vui lòng đợi...");
        }
      },
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: "Bạn không nhận được mã? ",
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: "Gửi lại lần nữa",
              style: TextStyle(
                color: _controller.isActiveButton == true
                    ? AppColor.secondary
                    : AppColor.colorGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

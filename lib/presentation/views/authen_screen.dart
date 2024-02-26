// ignore_for_file: no_leading_underscores_for_local_identifiers, unrelated_type_equality_checks, non_constant_identifier_names

import 'package:counting_love_day/app/configs/app_color.dart';
import 'package:counting_love_day/app/configs/reponsive.dart';
import 'package:counting_love_day/presentation/components/input.dart';
import 'package:counting_love_day/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthenScreen extends StatelessWidget {
  const AuthenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Reponsive().setSize(context);
    AuthController _controller = Get.find(tag: "auth_controller");

    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: Reponsive.width,
                  height: Reponsive.height,
                  child: CustomPaint(
                    painter: PaintLine(Reponsive.height),
                  ),
                ),
                Positioned(
                  top: Reponsive.height * 0.25,
                  left: Reponsive.width * 0.05,
                  child: Container(
                    width: Reponsive.width * 0.9,
                    height: Reponsive.height * 0.6,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8, //độ mờ
                            blurStyle: BlurStyle.normal, //hiệu ứng mờ
                            spreadRadius: .1, //độ lan rộng
                            offset: Offset(0.5, 0.5)), //vị trí
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign in ❤️",
                            style: TextStyle(
                              fontSize: Reponsive.fontSize * 8,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: Reponsive.height * 0.05),
                          _formLogin(_controller.formKey, _controller),
                          SizedBox(height: Reponsive.height * 0.01),
                          SizedBox(
                            width: Reponsive.width,
                            child: Text(
                              "Forgot your password?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColor.blue,
                              ),
                            ),
                          ),
                          SizedBox(height: Reponsive.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: Reponsive.width / 4,
                                child: Divider(
                                  height: 10,
                                  color: AppColor.silver,
                                  thickness: 1,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text("or use"),
                              ),
                              SizedBox(
                                width: Reponsive.width / 4,
                                child: Divider(
                                  height: 10,
                                  color: AppColor.silver,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Form _formLogin(GlobalKey<FormState> _formKey, AuthController _controller) {
    return Form(
      key: _formKey,
      child: Obx(
        () => Column(
          children: [
            Input(
              _controller.userName,
              _controller.focusNode1,
              _controller,
              "User name",
              _controller.isFocus1,
              TextInputType.emailAddress,
            ),
            SizedBox(height: Reponsive.height * 0.01),
            Input(
              _controller.password,
              _controller.focusNode2,
              _controller,
              "Password",
              _controller.isFocus2,
              TextInputType.text,
            ),
            SizedBox(height: Reponsive.height * 0.02),
            ElevatedButton(
              onPressed: () async {
                if (await _controller.withLogin() == 2) {
                  Fluttertoast.showToast(
                      msg: "Tài khoản hoặc mật khẩu không chính xác!");
                } else if (await _controller.withLogin() == 1) {
                  Fluttertoast.showToast(msg: "Vui lòng xác thực tài khoản!");
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: AppColor.primary,
                fixedSize: Size(Reponsive.width, Reponsive.height * 0.06),
              ),
              child: const Text(
                "Sign in",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaintLine extends CustomPainter {
  final double screenHeight;
  PaintLine(this.screenHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine1 = Paint()
      ..style = PaintingStyle.fill
      ..color = AppColor.secondary;

    final paintLine2 = Paint()
      ..style = PaintingStyle.fill
      ..color = AppColor.primary;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(150, 100, 15, screenHeight / 2),
        topLeft: const Radius.circular(15),
        topRight: const Radius.circular(15),
      ),
      paintLine1,
    );

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(200, 100, 50, screenHeight),
        topLeft: const Radius.circular(15),
        topRight: const Radius.circular(15),
      ),
      paintLine2,
    );
  }

  @override
  bool shouldRepaint(PaintLine oldDelegate) => false;
}

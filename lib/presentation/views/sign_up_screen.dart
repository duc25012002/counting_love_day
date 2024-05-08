import 'package:carousel_slider/carousel_slider.dart';
import 'package:counting_love_day/app/configs/config_app_color.dart';
import 'package:counting_love_day/app/configs/config_responsive.dart';
import 'package:counting_love_day/app/router/routes.dart';
import 'package:counting_love_day/app/util/util_assets.dart';
import 'package:counting_love_day/presentation/components/component_input.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthController _controller = Get.find(tag: "auth_controller");
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    Responsive(context);
    final listInput = <Widget>[
      Input(
        _controller.email,
        "Enter your email",
        shadow: false,
        _controller.isFocus,
        TextInputType.emailAddress,
      ),
      Input(
        _controller.password,
        "Enter your password",
        _controller.isFocus,
        shadow: false,
        TextInputType.text,
      ),
      Input(
        _controller.passwordConfirm,
        "Enter your password confirmation",
        _controller.isFocus,
        shadow: false,
        TextInputType.text,
      ),
      Input(
        _controller.userName,
        "Enter your user name",
        _controller.isFocus,
        shadow: false,
        TextInputType.text,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: Responsive.width,
            height: Responsive.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Lottie.asset(
                  Assets.lottieCouple,
                  height: Responsive.height / 2.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bắt đầu nào",
                        style: TextStyle(
                          fontSize: Responsive.fontSize * 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Đăng ký để bắt đầu sử dụng Kapo",
                        style: TextStyle(
                          fontSize: Responsive.fontSize * 8,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: Responsive.height / 2.5,
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: listInput,
                        carouselController: carouselController,
                        options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          viewportFraction: 0.9,
                          initialPage: 0,
                          onPageChanged: (index, reason) async {
                            _controller.current.value = index;
                          },
                        ),
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: listInput.asMap().entries.map(
                            (entry) {
                              return Container(
                                width: 18.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _controller.current.value == entry.key
                                      ? AppColor.secondary
                                      : AppColor.primary,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_controller.current.value == 0) {
                              await _controller.withCheckMail();
                              if (_controller.reponseCode.value == 0) {
                                _controller.nextPage.value = true;
                              } else if (_controller.reponseCode.value == 1) {
                                Fluttertoast.showToast(
                                    msg: "Vui lòng nhập đúng định dạng email.");
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Email đã tồn tại. Vui lòng sử dụng email khác.");
                              }
                            }
                            if (_controller.current.value == 3) {
                              await _controller.withRegister();
                              if (_controller.reponseCode.value == 0) {
                                Fluttertoast.showToast(
                                  msg:
                                      "Đăng ký thành công. Vui lòng xác thực tài khoản.",
                                );
                                _controller.nextPage.value = false;
                                Get.toNamed(Routes.verifyEmailScreen);
                              } else if (_controller.reponseCode.value == 2) {
                                Fluttertoast.showToast(
                                  msg: "Tài khoản đã tồn tại.",
                                );
                              } else if (_controller.reponseCode.value == 3) {
                                Fluttertoast.showToast(
                                  msg:
                                      "Vui lòng kiểm tra email và xác thực tài khoản.",
                                );
                              }
                            }

                            if (_controller.nextPage.value == true) {
                              carouselController.nextPage(
                                duration: const Duration(milliseconds: 350),
                                curve: Curves.easeInToLinear,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.actionColor,
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            weight: 30,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

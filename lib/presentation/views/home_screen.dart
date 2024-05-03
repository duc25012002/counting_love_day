// ignore_for_file: deprecated_member_use, no_leading_underscores_for_local_identifiers, unrelated_type_equality_checks, invalid_use_of_protected_member

import 'package:counting_love_day/app/configs/config_export.dart';
import 'package:counting_love_day/app/util/util_assets.dart';
import 'package:counting_love_day/app/util/util_log.dart';
import 'package:counting_love_day/presentation/components/component_input.dart';
import 'package:counting_love_day/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../components/component_button_premium.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = Get.find(tag: "home_controller");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    Container top = Container(
      width: Responsive.width,
      height: Responsive.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: _controller.checkCouple == 0
          ? Stack(
              children: [
                Positioned(
                  top: Responsive.height * 0.05,
                  left: responsive.onePersentHeight,
                  height: Responsive.height * 0.08,
                  width: Responsive.width - 100,
                  child: Input(
                    radius: 30,
                    _controller.email,
                    "titleFind".tr,
                    _controller.isFocus,
                    TextInputType.emailAddress,
                    hintText: true,
                    boder: false,
                    suffix: InkWell(
                      onTap: () async {
                        await _controller.withSendRequest();
                        log.i(_controller.email.text);
                        if (_controller.reponseCode.value == 0) {
                          Fluttertoast.showToast(
                            msg: "Gửi yêu cầu thành công 🥰",
                          );
                        } else if (_controller.reponseCode.value == 2) {
                          Fluttertoast.showToast(
                            msg: "Bạn có độc thân đâu. Đừng thế chứ 😢",
                          );
                        } else if (_controller.reponseCode.value == 3) {
                          Fluttertoast.showToast(
                            msg: "Bạn đang gửi yêu cầu 1 bạn khác rồi mà 🥹",
                          );
                        } else if (_controller.reponseCode.value == 4) {
                          Fluttertoast.showToast(
                            msg: "Bạn ấy không dùng app rồi 😖",
                          );
                        } else if (_controller.reponseCode.value == 7) {
                          Fluttertoast.showToast(
                            msg: "Hệ thống hiện đang lỗi 🚧",
                          );
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(Responsive.fontSize * 4),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColor.linearGradient1,
                                AppColor.linearGradient2,
                              ],
                            ),
                          ),
                          child: SvgPicture.asset(
                            IconAssets.iconFly,
                            fit: BoxFit.scaleDown,
                            width: Responsive.width * 0.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          : const Row(
              children: [],
            ),
    );

    dynamic viewAll = Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'viewAll'.tr,
            style: const TextStyle(fontSize: 13),
          ),
          const Icon(Icons.arrow_circle_right_outlined),
        ],
      ),
    );

    // TODO: center
    Container center = Container(
      width: Responsive.width,
      height: Responsive.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          children: [
            viewAll,
            SizedBox(height: Responsive.height * 0.02),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: Responsive.width * 0.5,
                    height: Responsive.height * 0.21,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.colorGrey,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Responsive.width,
                          height: Responsive.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.colorGrey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Container(
                                    width: Responsive.width,
                                    height: Responsive.height * 0.1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.colorGrey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: Responsive.width,
                                  height: Responsive.height * 0.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.colorGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

    Positioned buttonAddCouple = Positioned(
      top: Responsive.height * 0.75,
      left: 0,
      right: 0,
      child: Container(
        width: Responsive.width,
        height: Responsive.height * 0.05,
        decoration: BoxDecoration(
          color: AppColor.bgrButtonCouple,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("requestAddCouple".tr),
              InkWell(
                onTap: () async {
                  await _controller.withGetListRequest();
                  Get.bottomSheet(
                    Container(
                      height: Responsive.height * 0.3,
                      color: Colors.white,
                      child: Center(
                        child: ListView.builder(
                          itemCount: _controller.listRequest.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 8,
                              ),
                              child: Container(
                                width: Responsive.width,
                                height: Responsive.height * 0.05,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  color: AppColor.bgrButtonCouple,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${_controller.listRequest[index].userEmail}",
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: Responsive.width * 0.2,
                                          height: Responsive.height * 0.1,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                AppColor.linearGradient1,
                                                AppColor.linearGradient2,
                                              ],
                                            ),
                                          ),
                                          child: Text(
                                            'addCouple'.tr,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: Responsive.width * 0.2,
                  height: Responsive.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColor.linearGradient1,
                        AppColor.linearGradient2,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'checkButton'.tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // TODO: bottom
    Container bottom = Container(
      width: Responsive.width,
      height: Responsive.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.receipt_sharp,
                          color: AppColor.secondary,
                        ),
                        SizedBox(width: Responsive.width * 0.01),
                        Text(
                          "reminder".tr,
                          style: TextStyle(
                            color: AppColor.secondary,
                            fontSize: Responsive.fontSize * 8,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "commentsReminder".tr,
                      style: TextStyle(color: AppColor.textPurple),
                    ),
                  ],
                ),
                viewAll
              ],
            ),
            SizedBox(height: Responsive.height * 0.02),
            Center(
              child: SvgPicture.asset(
                IconAssets.empty,
                width: Responsive.width * 0.5,
                height: Responsive.height * 0.2,
              ),
            ),
          ],
        ),
      ),
    );

    // TODO: main
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Stack(
            children: [
              Positioned(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: Responsive.height * 0.06),
                          top,
                          SizedBox(height: Responsive.height * 0.02),
                          center,
                          SizedBox(height: Responsive.height * 0.02),
                          bottom,
                          SizedBox(height: Responsive.height * 0.15),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                child: ButtonPremium(),
              ),

              // TODO: button list couple
              _controller.checkCouple == 0 ? buttonAddCouple : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:counting_love_day/app/configs/config_responsive.dart';
import 'package:counting_love_day/app/router/routes.dart';
import 'package:counting_love_day/app/util/util_assets.dart';
import 'package:counting_love_day/presentation/components/component_card_setting.dart';
import 'package:counting_love_day/presentation/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/configs/config_app_color.dart';
import '../../app/util/language/localization_service.dart';
import '../components/component_button_premium.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final SettingController _controller = Get.find(tag: "setting_controller");
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    // List listSetting = [
    //   {
    //     "title": "notificationSettin".tr,
    //     "icon": IconAssets.iconNotification,
    //     "border": "all",
    //     "function": () {}
    //   },
    //   {
    //     "title": "languageSetting".tr,
    //     "icon": IconAssets.iconLanguage,
    //     "border": "top",
    //     "function": () {
    //       Get.dialog(
    //         SimpleDialog(
    //           title: Center(child: Text('selectLanguage'.tr)),
    //           children: [
    //             SimpleDialogOption(
    //               onPressed: () {
    //                 LocalizationService.changeLocale("vi");
    //                 _controller.saveDataLanguage("vi");
    //                 Get.back();
    //               },
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                   border: Border.all(),
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Text('viet'.tr),
    //                 ),
    //               ),
    //             ),
    //             SimpleDialogOption(
    //               onPressed: () {
    //                 LocalizationService.changeLocale("en");
    //                 _controller.saveDataLanguage("en");
    //                 Get.back();
    //               },
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                   border: Border.all(),
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Text('anh'.tr),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
    //     }
    //   },
    //   {
    //     "title": "themeSetting".tr,
    //     "icon": IconAssets.iconMoon,
    //     "border": "bottom",
    //     "function": () {
    //       Get.changeTheme(
    //         Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
    //       );
    //     },
    //   },
    //   {
    //     "title": "shareSetting".tr,
    //     "icon": IconAssets.iconShare,
    //     "border": "bottom",
    //     "function": () {
    //       Get.dialog(
    //         AlertDialog(
    //           title: const Text('Chia sẻ ứng dụng'),
    //           content: const Text('facebook.com'),
    //           actions: [
    //             TextButton(
    //               onPressed: () {
    //                 Get.back();
    //               },
    //               child: const Text('Close'),
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   },
    //   {
    //     "title": "disconnectSetting".tr,
    //     "icon": IconAssets.iconDisconect,
    //     "border": "all",
    //     "function": () {}
    //   },
    //   {
    //     "title": "deleteAccountSetting".tr,
    //     "icon": IconAssets.iconDelete,
    //     "border": "all",
    //     "function": () {}
    //   },
    //   {
    //     "title": "logoutSetting".tr,
    //     "icon": IconAssets.iconLogout,
    //     "border": "all",
    //     "function": () {
    //       Get.offAllNamed(Routes.loginScreen);
    //     },
    //   }
    // ];

    Container top = Container(
      width: Responsive.width * 0.9,
      height: Responsive.height * 0.22,
      decoration: BoxDecoration(
        color: isDarkMode(context)
            ? const Color.fromARGB(255, 76, 76, 76)
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            IconAssets.iconUser,
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Username"),
              responsive.gapH(0.01),
              const Text("0123456789"),
              responsive.gapH(0.01),
              const Text("Heromm@gmail.com"),
              responsive.gapH(0.01),
              InkWell(
                onTap: () {},
                child: Container(
                  height: Responsive.width * 0.06,
                  width: Responsive.width * 0.4,
                  decoration: BoxDecoration(
                    color: AppColor.actionColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "updateInfo".tr,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
    Container center = Container(
      width: Responsive.width * 0.92,
      height: Responsive.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              responsive.gapH(0.03),
              CardSetting(
                'notificationSetting'.tr,
                IconAssets.iconNotification,
                "all",
                () {},
              ),
              responsive.gapH(0.02),
              CardSetting(
                "languageSetting".tr,
                IconAssets.iconLanguage,
                "top",
                () {
                  Get.dialog(
                    SimpleDialog(
                      title: Center(child: Text('selectLanguage'.tr)),
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            LocalizationService.changeLocale("vi");

                            _controller.saveDataLanguage("vi");
                            Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              //color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('viet'.tr),
                            ),
                          ),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            LocalizationService.changeLocale("en");
                            _controller.saveDataLanguage("en");
                            Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              //color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('anh'.tr),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              CardSetting(
                "themeSetting".tr,
                IconAssets.iconMoon,
                "bottom",
                () {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                },
              ),
              responsive.gapH(0.02),
              CardSetting("voteSetting".tr, IconAssets.iconVote, "top", () {}),
              CardSetting(
                "shareSetting".tr,
                IconAssets.iconShare,
                "bottom",
                () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('Chia sẻ ứng dụng'),
                      content: const Text('facebook.com'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              responsive.gapH(0.02),
              CardSetting(
                "disconnectSetting".tr,
                IconAssets.iconDisconect,
                "all",
                () {},
              ),
              responsive.gapH(0.01),
              CardSetting(
                "deleteAccountSetting".tr,
                IconAssets.iconDelete,
                "all",
                () {},
              ),
              responsive.gapH(0.02),
              CardSetting(
                "logoutSetting".tr,
                IconAssets.iconLogout,
                "all",
                () {
                  Get.offAllNamed(Routes.loginScreen);
                },
              ),
              responsive.gapH(0.02),
            ],
          ),
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
                          const ButtonPremium(),
                          responsive.gapH(0.01),
                          top,
                          responsive.gapH(0.02),
                          center,
                          responsive.gapH(0.01),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

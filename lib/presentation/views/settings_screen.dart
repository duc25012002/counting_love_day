// ignore_for_file: deprecated_member_use

import 'package:counting_love_day/app/services/log.dart';
import 'package:counting_love_day/app/util/assets_manager.dart';
import 'package:counting_love_day/presentation/components/card_setting.dart';
import 'package:counting_love_day/presentation/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/configs/app_color.dart';
import '../../app/configs/reponsive.dart';

import '../../app/util/language/localization_service.dart';
import '../components/button_premium.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final SettingController _controller = Get.find(tag: "setting_controller");
  @override
  Widget build(BuildContext context) {
    Reponsive().setSize(context);

    //  StaticString str = StaticString();

    Container top = Container(
      width: Reponsive.width * 0.9,
      height: Reponsive.height * 0.22,
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
              SizedBox(height: Reponsive.height * 0.01),
              const Text("0123456789"),
              SizedBox(height: Reponsive.height * 0.01),
              const Text("Heromm@gmail.com"),
              SizedBox(height: Reponsive.height * 0.01),
              InkWell(
                onTap: () {
                  log.d("Hiiiiii");
                },
                child: Container(
                  height: Reponsive.width * 0.06,
                  width: Reponsive.width * 0.4,
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
      width: Reponsive.width * 0.92,
      height: Reponsive.height * 0.5,
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
              SizedBox(height: Reponsive.height * 0.03),
              CardSetting(
                'notificationSetting'.tr,
                IconAssets.iconNotification,
                "all",
                () {},
              ),
              SizedBox(height: Reponsive.height * 0.02),
              CardSetting(
                "languageSetting".tr,
                IconAssets.iconLanguage,
                "top",
                () {
                  Get.dialog(SimpleDialog(
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
                  ));
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
              SizedBox(height: Reponsive.height * 0.02),
              CardSetting("voteSetting".tr, IconAssets.iconVote, "top", () {}),
              CardSetting("shareSetting".tr, IconAssets.iconShare, "bottom",
                  () {
                Get.dialog(
                  AlertDialog(
                    title: Text('Chia sẻ ứng dụng'),
                    content: Text('facebook.com'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: Reponsive.height * 0.02),
              CardSetting("disconnectSetting".tr, IconAssets.iconDisconect,
                  "all", () {}),
              SizedBox(height: Reponsive.height * 0.01),
              CardSetting("deleteAccountSetting".tr, IconAssets.iconDelete,
                  "all", () {}),
              SizedBox(height: Reponsive.height * 0.02),
              CardSetting(
                  "logoutSetting".tr, IconAssets.iconLogout, "all", () {}),
              SizedBox(height: Reponsive.height * 0.02),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      // main--------------------------------------------------------
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
                          SizedBox(height: Reponsive.height * 0.02),
                          const ButtonPremium(),
                          SizedBox(height: Reponsive.height * 0.01),
                          top,
                          SizedBox(height: Reponsive.height * 0.02),
                          center,
                          SizedBox(height: Reponsive.height * 0.02),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //sPositioned(child: child)
            ],
          ),
        ),
      ),
    );
  }
}

languageSelect(SettingController controller) {}

// ignore_for_file: deprecated_member_use

import 'package:counting_love_day/app/configs/config.dart';
import 'package:counting_love_day/app/util/assets_manager.dart';
import 'package:counting_love_day/presentation/components/input.dart';
import 'package:counting_love_day/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Reponsive().setSize(context);
    HomeController _controller = Get.find(tag: "home_controller");

    Container body = Container(
      width: Reponsive.width,
      height: Reponsive.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: Reponsive.width * 0.1,
            top: Reponsive.height * 0.05,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.6),
            ),
          ),
          Positioned(
            left: Reponsive.width * 0.7,
            top: Reponsive.height * 0.05,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.6),
            ),
          ),
          Positioned(
            top: Reponsive.height * 0.06,
            left: Reponsive.width * 0.08,
            child: Container(
              width: Reponsive.width * 0.8,
              height: Reponsive.height * 0.5,
              decoration: const BoxDecoration(color: Colors.white),
              child: Input(
                _controller.email,
                "Nhập email người ghép đôi với bạn",
                _controller.isFocus,
                TextInputType.emailAddress,
                (p0) => null,
              ),
            ),
          )
        ],
      ),
    );

    Row header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: Reponsive.width * 0.6,
          height: Reponsive.height * 0.04,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(IconAssets.iconPremium),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Get",
                        style: TextStyle(
                          color: AppColor.textPurple,
                          fontSize: Reponsive.fontSize * 5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: " Kapo Premium ",
                        style: TextStyle(
                          color: AppColor.actionColor,
                          fontSize: Reponsive.fontSize * 5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "now ",
                        style: TextStyle(
                          color: AppColor.textPurple,
                          fontSize: Reponsive.fontSize * 5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "→",
                        style: TextStyle(
                          color: AppColor.actionColor,
                          fontSize: Reponsive.fontSize * 5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        CircleAvatar(
          radius: 20,
          child: SvgPicture.asset(
            IconAssets.iconUser,
            width: 50,
            height: 50,
            color: Colors.white,
          ),
        )
      ],
    );

    // main
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              header,
              SizedBox(height: Reponsive.height * 0.02),
              body,
            ],
          ),
        ),
      ),
    );
  }
}

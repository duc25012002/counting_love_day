// ignore_for_file: deprecated_member_use, no_leading_underscores_for_local_identifiers

import 'package:counting_love_day/app/configs/config.dart';
import 'package:counting_love_day/app/util/assets_manager.dart';
import 'package:counting_love_day/app/util/static_string.dart';
import 'package:counting_love_day/presentation/components/input.dart';
import 'package:counting_love_day/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/button_premium.dart';

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
    StaticString str = StaticString();

    Container top = Container(
      width: Reponsive.width,
      height: Reponsive.height * 0.2,
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
      child: Stack(
        children: [
          Positioned(
            top: Reponsive.height * 0.05,
            left: Reponsive.width * 0.1,
            height: Reponsive.height * 0.08,
            width: Reponsive.width - 100,
            child: Input(
              radius: 30,
              _controller.email,
              "Nhập email người ghép đôi với bạn",
              _controller.isFocus,
              TextInputType.emailAddress,
              hintText: true,
              boder: false,
              suffix: Padding(
                padding: EdgeInsets.all(Reponsive.fontSize * 4),
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
                    width: Reponsive.width * 0.1,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );

    Row viewAll = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(str.viewAll),
        const Icon(Icons.arrow_circle_right_outlined),
      ],
    );

    Container center = Container(
      width: Reponsive.width,
      height: Reponsive.height * 0.3,
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
            SizedBox(height: Reponsive.height * 0.02),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: Reponsive.width * 0.5,
                    height: Reponsive.height * 0.21,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Reponsive.width,
                          height: Reponsive.height * 0.1,
                          color: Colors.red,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Container(
                                    width: Reponsive.width,
                                    height: Reponsive.height * 0.1,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: Reponsive.width,
                                  height: Reponsive.height * 0.1,
                                  color: Colors.green,
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
      top: Reponsive.height * 0.75,
      left: 0,
      right: 0,
      child: Container(
        width: Reponsive.width,
        height: Reponsive.height * 0.05,
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
              Text(str.requestAddCouple),
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      height: Reponsive.height * 0.3,
                      color: Colors.white,
                      child: Center(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Text(
                              "a $index",
                              style: TextStyle(color: Colors.amber),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: Reponsive.width * 0.2,
                  height: Reponsive.height * 0.1,
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
                    str.checkButton,
                    style: const TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    Container bottom = Container(
      width: Reponsive.width,
      height: Reponsive.height * 0.3,
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
                        SizedBox(width: Reponsive.width * 0.01),
                        Text(
                          str.reminder,
                          style: TextStyle(
                            color: AppColor.secondary,
                            fontSize: Reponsive.fontSize * 8,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      str.commentsReminder,
                      style: TextStyle(color: AppColor.textPurple),
                    ),
                  ],
                ),
                viewAll
              ],
            ),
            SizedBox(height: Reponsive.height * 0.02),
            Center(
              child: SvgPicture.asset(IconAssets.empty),
            ),
          ],
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
                          SizedBox(height: Reponsive.height * 0.06),
                          top,
                          SizedBox(height: Reponsive.height * 0.02),
                          center,
                          SizedBox(height: Reponsive.height * 0.02),
                          bottom,
                          SizedBox(height: Reponsive.height * 0.15),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                child: ButtonPremium(),
              ),
              buttonAddCouple,
            ],
          ),
        ),
      ),
    );
  }
}

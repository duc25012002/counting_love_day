// ignore_for_file: deprecated_member_use

import 'package:counting_love_day/app/configs/config.dart';
import 'package:counting_love_day/app/util/icon_assets.dart';
import 'package:counting_love_day/presentation/views/home_screen.dart';
import 'package:counting_love_day/presentation/views/settings_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class StartApp extends StatefulWidget {
  const StartApp({super.key});
  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 2);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.memories,
        ),
        title: ("anniversary".tr),
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: Colors.black26,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(EvaIcons.clockOutline),
        title: ("reminder".tr),
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: Colors.black26,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.iconHome, width: 30, height: 30),
        title: ("home".tr),
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: Colors.black26,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(EvaIcons.bellOutline),
        title: ("notification".tr),
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: Colors.black26,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(EvaIcons.settings),
        title: ("setting".tr),
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: Colors.black26,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      Container(color: Colors.black),
      Container(color: Colors.red),
      const HomeScreen(),
      Container(color: Colors.blue),
      const SettingScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}

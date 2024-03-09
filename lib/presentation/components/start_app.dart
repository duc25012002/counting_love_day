import 'package:counting_love_day/app/configs/app_color.dart';
import 'package:counting_love_day/app/util/assets_manager.dart';
import 'package:counting_love_day/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        icon: SvgPicture.asset(
          IconAssets.iconMemory,
          width: 80,
          height: 80,
        ),
        title: ("Kỷ niệm"),
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: Colors.black26,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.iconReminder, width: 80, height: 80),
        title: ("Nhắc nhở"),
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: Colors.black26,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.iconHome, width: 30, height: 30),
        title: ("Home"),
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: Colors.black26,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.iconNotify, width: 80, height: 80),
        title: ("Thông báo"),
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: Colors.black26,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.iconSetting, width: 80, height: 80),
        title: ("Thông báo"),
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
      Container(color: Colors.green),
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

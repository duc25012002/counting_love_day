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
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}

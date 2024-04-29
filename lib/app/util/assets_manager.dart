// ignore_for_file: constant_identifier_names, unused_element

import 'package:flutter/material.dart';

const _icons = "assets/icons";
const _images = "";
const _lottie = "assets/lotties";
const _font = "";

class IconAssets {
  static const String iconUser = "$_icons/user.svg";
  static const String iconMemory = "$_icons/icon_memory.svg";
  static const String iconReminder = "$_icons/BsClock.svg";
  static const String iconNotify = "$_icons/Vector.svg";
  static const String iconHome = "$_icons/Group_94.svg";
  static const String iconSetting = "$_icons/setting.svg";
  static const String iconPremium = "$_icons/premium.png";
  static const String iconFly = "$_icons/icon_fly.svg";
  static const String empty = "$_icons/empty.svg";

  static const String iconDelete = "$_icons/delete.svg";
  static const String iconDisconect = "$_icons/disconect.svg";
  static const String iconLanguage = "$_icons/language.svg";
  static const String iconLogout = "$_icons/logout.svg";
  static const String iconMoon = "$_icons/moon.svg";
  static const String iconNotification = "$_icons/notification.svg";
  static const String iconShare = "$_icons/share.svg";
  static const String iconVote = "$_icons/vote.svg";

  static const String lottieCouple = "$_lottie/couple.json";

  static const String ic_default_image = "$_icons/ic_default_image.png";
}

bool isDarkMode(BuildContext context) {
  // var brightness = SchedulerBinding.instance.window.platformBrightness;
  var brightness = Theme.of(context).brightness;
  return brightness == Brightness.dark;
}

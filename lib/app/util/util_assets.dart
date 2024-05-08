// ignore_for_file: constant_identifier_names, unused_element

import 'package:flutter/material.dart';

const _icons = "assets/icons";
const _images = "";
const _lottie = "assets/lotties";
const _font = "";

class Assets {
  static const String iconUser = "$_icons/icon_user.svg";
  static const String iconMemory = "$_icons/icon_memory.svg";
  static const String iconReminder = "$_icons/icon_reminder.svg";
  static const String iconNotify = "$_icons/icon_notification.svg";
  static const String iconHome = "$_icons/icon_home.svg";
  static const String iconSetting = "$_icons/setting.svg";
  static const String iconPremium = "$_icons/premium.png";
  static const String iconFly = "$_icons/icon_fly.svg";
  static const String empty = "$_icons/icon_empty.svg";
  static const String iconDelete = "$_icons/icon_delete.svg";
  static const String iconDisconect = "$_icons/icon_disconect.svg";
  static const String iconLanguage = "$_icons/icon_language.svg";
  static const String iconLogout = "$_icons/icon_logout.svg";
  static const String iconMoon = "$_icons/icon_moon.svg";
  static const String iconNotification = "$_icons/notification.svg";
  static const String iconShare = "$_icons/share.svg";
  static const String iconVote = "$_icons/icon_vote.svg";

  static const String lottieCouple = "$_lottie/couple.json";

  static const String ic_default_image = "$_icons/ic_default_image.png";

  static const String ic_heart_border = "$_icons/icon_heart_border.png";
  static const String ic_heart_half = "$_icons/icon_heart_half.png";
  static const String ic_heart = "$_icons/icon_heart.png";
}

bool isDarkMode(BuildContext context) {
  var brightness = Theme.of(context).brightness;
  return brightness == Brightness.dark;
}

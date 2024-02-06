import 'package:flutter/material.dart';

class Reponsive {
  static MediaQueryData mediaQueryData = const MediaQueryData();
  static double width = 0;
  static double height = 0;
  static double fontSize = 0;

  void setSize(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    width = mediaQueryData.size.width;
    height = mediaQueryData.size.height;
    fontSize = mediaQueryData.devicePixelRatio; //3px - 1 điểm ảnh
  }
}

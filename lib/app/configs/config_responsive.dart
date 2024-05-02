import 'package:flutter/material.dart';

class Responsive {
  static MediaQueryData mediaQueryData = const MediaQueryData();
  static double width = 0;
  static double height = 0;
  static double fontSize = 0;
  final double onePersentHeight = height * 0.1;

  Responsive(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    width = mediaQueryData.size.width;
    height = mediaQueryData.size.height;
    fontSize = mediaQueryData.devicePixelRatio; //3px - 1 điểm ảnh
  }

  static void setSize(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    width = mediaQueryData.size.width;
    height = mediaQueryData.size.height;
    fontSize = mediaQueryData.devicePixelRatio; //3px - 1 điểm ảnh
  }

  /// [vertical] --- ex: gapH(0.1)
  Widget gapH(double percentage) {
    return SizedBox(height: height * percentage);
  }

  /// [vertical] 5% for your screen
  Widget gapH5() {
    return SizedBox(height: height * 0.05);
  }

  /// [vertical] 10% for your screen
  Widget gapH10() {
    return SizedBox(height: height * 0.1);
  }

  /// [vertical] 15% for your screen
  Widget gapH15() {
    return SizedBox(height: height * 0.15);
  }

  /// [vertical] 20% for your screen
  Widget gapH20() {
    return SizedBox(height: height * 0.2);
  }

  /// [horizontal] --- ex: gapW(0.1)
  Widget gapW(double percentage) {
    return SizedBox(width: width * percentage);
  }

  /// [horizontal] 5% for your screen
  Widget gapW5() {
    return SizedBox(width: width * 0.05);
  }

  /// [horizontal] 10% for your screen

  Widget gapW10() {
    return SizedBox(width: width * 0.1);
  }

  /// [horizontal] 15% for your screen

  Widget gapW15() {
    return SizedBox(width: width * 0.15);
  }

  /// [horizontal] 20% for your screen

  Widget gapW20() {
    return SizedBox(width: width * 0.20);
  }
}

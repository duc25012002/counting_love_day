// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:counting_love_day/app/configs/config_app_color.dart';
import 'package:counting_love_day/app/configs/config_responsive.dart';
import 'package:counting_love_day/app/util/util_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

CardSetting({
  String? label,
  String? icon,
  String? circularDirect,
  functionButton,
}) {
  return InkWell(
    onTap: () {
      functionButton();
    },
    child: Container(
      // ignore: sort_child_properties_last
      child: Row(
        children: [
          SizedBox(width: Responsive.width * 0.02),
          SvgPicture.asset(
            icon ?? Assets.ic_default_image,
            color: AppColor.colorGrey,
          ),
          SizedBox(width: Responsive.width * 0.02),
          Text(label ?? ""),
        ],
      ),
      width: Responsive.width * 0.82,
      height: Responsive.height * 0.06,
      decoration: BoxDecoration(
        border: const Border(
          bottom: BorderSide(
            color: Colors.black, // Màu sắc của viền đáy
            width: 0.5, // Độ dày của viền đáy
            style: BorderStyle.solid, // Kiểu của viền (solid, dashed, dotted)
          ),
        ),
        color: const Color.fromARGB(255, 237, 234, 234),
        borderRadius: circularDirect != "all"
            ? circularDirect != "top"
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  )
            : BorderRadius.circular(15),
      ),
    ),
  );
}

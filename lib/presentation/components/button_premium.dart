// ignore_for_file: deprecated_member_use

import 'package:counting_love_day/app/configs/config_responsive.dart';
import 'package:counting_love_day/app/util/util_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/configs/app_color.dart';
import '../../app/util/util_assets.dart';

class ButtonPremium extends StatelessWidget {
  const ButtonPremium({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.setSize(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: Responsive.width * 0.6,
          height: Responsive.height * 0.04,
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
          child: InkWell(
            onTap: () {
              log.d("Button Premium");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(IconAssets.iconPremium),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Get ",
                        style: TextStyle(
                          color: AppColor.textPurple,
                          fontSize: Responsive.fontSize * 5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "Kapo Premium",
                        style: TextStyle(
                          color: AppColor.actionColor,
                          fontSize: Responsive.fontSize * 5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: " now ",
                        style: TextStyle(
                          color: AppColor.textPurple,
                          fontSize: Responsive.fontSize * 5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "→",
                        style: TextStyle(
                          color: AppColor.actionColor,
                          fontSize: Responsive.fontSize * 5,
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
  }
}

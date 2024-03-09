import 'package:counting_love_day/app/services/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/configs/app_color.dart';
import '../../app/configs/reponsive.dart';
import '../../app/util/assets_manager.dart';

class ButtonPremium extends StatelessWidget {
  const ButtonPremium({super.key});

  @override
  Widget build(BuildContext context) {
    Reponsive().setSize(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: Reponsive.width * 0.6,
          height: Reponsive.height * 0.04,
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
                          fontSize: Reponsive.fontSize * 5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "Kapo Premium",
                        style: TextStyle(
                          color: AppColor.actionColor,
                          fontSize: Reponsive.fontSize * 5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: " now ",
                        style: TextStyle(
                          color: AppColor.textPurple,
                          fontSize: Reponsive.fontSize * 5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "→",
                        style: TextStyle(
                          color: AppColor.actionColor,
                          fontSize: Reponsive.fontSize * 5,
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

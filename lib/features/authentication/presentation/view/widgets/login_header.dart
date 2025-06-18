import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/constants.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImage.loginBackground),
        Positioned(
          bottom: 0,
          left: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 13.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppIcons.logo),
                    Text(
                      AppStrings.appTitle,
                      style: AppStyle.heading.copyWith(
                        fontFamily: "SFpro",
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                Text(AppStrings.welcomeBack, style: AppStyle.titleMedium),
                SizedBox(height: 5),
                Text(AppStrings.workSpace, style: AppStyle.bodyWhite14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

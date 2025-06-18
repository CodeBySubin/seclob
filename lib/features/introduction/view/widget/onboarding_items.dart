import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';

class Boardings extends StatelessWidget {
  final String title;
  final String subTitle;
  final String highlightText;
  final String image;

  const Boardings({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.highlightText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 80.h,
        left: 12.w,
        right: 12.w,
        bottom: 50.h,
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyle.heading),
          Container(
            decoration: BoxDecoration(
              color: AppColor.lightPurple,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              child: Text(highlightText, style: AppStyle.purpleHeading),
            ),
          ),
          Text(subTitle, style: AppStyle.lightblackText),
          Spacer(),
          Center(child: Image.asset(width: 297.w, height: 350.h, image)),
        ],
      ),
    );
  }
}

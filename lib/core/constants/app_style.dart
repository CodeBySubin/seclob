import 'package:flutter/material.dart';
import 'package:seclob/core/constants/constants.dart';

class AppStyle {
  static const TextStyle heading = TextStyle(
    color: Color(0xFF333333) ,
    fontFamily: "SFPro",
    fontSize: 28,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0.0,
  );
  static const TextStyle purpleHeading = TextStyle(
    fontFamily: "SFPro",
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: AppColor.colorprimary,
    height: 1.0,
    letterSpacing: 0.0,
  );

  static const TextStyle whiteButtonText = TextStyle(
    fontFamily: "SFPro",
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
    height: 1.0,
    letterSpacing: 0.0,
  );
   static const TextStyle lightblackText = TextStyle(
    fontFamily: "SFPro",
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.lightBlackColor,
    height: 1.0,
    letterSpacing: 0.0,
  );
  static const TextStyle bodyWhite14 = TextStyle(
  fontFamily: 'SFPro',
  fontWeight: FontWeight.w400,
  color: AppColor.white,
  fontSize: 14.0,
  height: 20 / 14, 
  letterSpacing: -0.5,
);
  static const TextStyle hintext = TextStyle(
  fontFamily: 'SFPro', 
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
  height: 1.0, 
  letterSpacing: 0.0,
);
  static const TextStyle titleMedium = TextStyle(
    fontFamily: 'SFPro',
    color: AppColor.white,
    fontWeight: FontWeight.w500,
    fontSize: 24.0,
    height: 32 / 24, 
    letterSpacing: -0.48, 
  );
  static const TextStyle bodySmallCentered = TextStyle(
  fontFamily: 'SFPro',
  fontWeight: FontWeight.w400,
  fontSize: 15.0,
  color: Color(0xFF333333),
  height: 16 / 12,
  letterSpacing: -0.06,
);
  static const TextStyle gridText = TextStyle(
   fontFamily: 'SFPro',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.0,
    letterSpacing: 0,
);

 static const TextStyle simpleGrey = TextStyle(
   fontFamily: 'SFPro',
   color: Color(0xFF85868B),
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.0,
    letterSpacing: 0,
);

}

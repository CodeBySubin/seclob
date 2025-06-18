import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

Widget textButton({
  required String text,
  Color color = AppColor.colorprimary,
  Color textcolor = AppColor.white,
  required void Function()? onPressed,
  BorderRadiusGeometry? borderRadius,
  Size? size,
  TextStyle? textStyle,
}) {
  final buttonSize = size ?? Size(316.w, 63.h);
  return TextButton(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(color),
      minimumSize: WidgetStatePropertyAll(buttonSize),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(08.r),
        ),
      ),
    ),
    onPressed: onPressed,
    child: Text(text, style: textStyle ?? AppStyle.whiteButtonText),
  );
}

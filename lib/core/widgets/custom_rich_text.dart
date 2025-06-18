// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../constants/constants.dart';

// class CustomRichText extends StatelessWidget {
//   final String normalText;
//   final String highlightedText;
//   final VoidCallback? onTap;
//   final TextStyle? normalStyle;
//   final TextStyle? highlightedStyle;
//   final TextAlign? textAlign;

//   const CustomRichText({
//     super.key,
//     required this.normalText,
//     required this.highlightedText,
//     this.onTap,
//     this.normalStyle,
//     this.highlightedStyle, 
//     this.textAlign,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       textAlign:textAlign?? TextAlign.center,
//       text: TextSpan(
//         text: normalText,
//         style:normalStyle?? GoogleFonts.montserrat(
//               textStyle: TextStyle(fontSize: 17.sp, color: AppColor.textgrey),
//             ),
//         children: [
//           TextSpan(
//             text: highlightedText,
//             style:highlightedStyle?? GoogleFonts.montserrat(
//               textStyle: TextStyle(fontSize: 17.sp, color: AppColor.textgrey),
//             ),
//             recognizer:
//                 onTap != null ? (TapGestureRecognizer()..onTap = onTap) : null,
//           ),
//         ],
//       ),
//     );
//   }
// }

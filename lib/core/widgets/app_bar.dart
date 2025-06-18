// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import '../../../core/enums/app_bar_type.dart';
// import '../constants/constants.dart';

// PreferredSizeWidget customAppbar(
//   BuildContext context, {
//     String? title,
//   AppBarType leadingType = AppBarType.profile,
// }) {
//   Widget? leading;
//   switch (leadingType) {
//     case AppBarType.profile:
//       leading = Row(
//         children: [
//           const Spacer(),
//           Stack(
//             children: [
//               // const CircleAvatar(backgroundImage: AssetImage(AppImage.person)),
//               Positioned(
//                 top: -2,
//                 right: -2,
//                 child: Container(
//                   width: 10.h,
//                   height: 10.w,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white),
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       );
//       break;
//     case AppBarType.arrowBack:
//       leading = IconButton(
//         style: ButtonStyle(
//           backgroundColor: WidgetStateProperty.all<Color>(
//             AppColor.lightGrey.withAlpha(50),
//           ),
//           shape: WidgetStateProperty.all<OutlinedBorder>(const CircleBorder()),
//         ),
//         icon: const Icon(
//           Icons.arrow_back_ios_new_outlined,
//           color: AppColor.textgrey,
//         ),
//         onPressed: () => context.pop(),
//       );
//       break;
//   }

//   return AppBar(
//     centerTitle: true,
//     title: Text(title??
//       AppStrings.appTitle,
//       style: const TextStyle(
//         color: Colors.black,
//         fontWeight: FontWeight.bold,
//         fontSize: 20,
//       ),
//     ),
//     leading: leading,
//     actions: [
//       IconButton(
//         style: ButtonStyle(
//           backgroundColor: WidgetStateProperty.all<Color>(
//             AppColor.lightGrey.withAlpha(50),
//           ),
//           shape: WidgetStateProperty.all<OutlinedBorder>(const CircleBorder()),
//         ),
//         onPressed: () {},
//         icon: Icon(Icons.abc)
//       ),
//     ],
//   );
// }

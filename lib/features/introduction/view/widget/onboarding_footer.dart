// path: lib/features/introduction/view/widget/onboarding_footer.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:seclob/core/routes/app_routes.dart';
import 'package:seclob/core/utils/storage_helper.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/widgets.dart';

class OnboardingFooter extends StatelessWidget {
  final int pageLength;
  final int currentIndex;
  final void Function(int) setIndex;

  const OnboardingFooter({
    super.key,
    required this.pageLength,
    required this.currentIndex,
    required this.setIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Indicator(
            spacing: EdgeInsets.all(2),
            currentIndex: currentIndex,
            pageLength: pageLength,
            activeColor: AppColor.colorprimary,
            color: AppColor.lightGrey,
            activeSize: Size(18.0.w, 9.0.h),
            size: Size(40.0.w, 9.0.h),
          ),
          SizedBox(height: 50.h),
          textButton(
            borderRadius: BorderRadius.circular(30.r),
            size: Size(double.infinity, 60.h),
            onPressed: () async{
              if (currentIndex < pageLength - 1) {
                setIndex(currentIndex + 1); 
              } else {
                context.go(AppRoutes.login);
               SecureStorageHelper.setOnboardingSeen();
              }
            },
            text: currentIndex < pageLength - 1
                ? AppStrings.next
                : AppStrings.signin,
            textStyle: AppStyle.whiteButtonText,
          ),
        ],
      ),
    );
  }
}

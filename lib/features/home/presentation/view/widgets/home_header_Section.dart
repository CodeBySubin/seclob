import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/constants.dart';

class HomeHeaderSection extends StatelessWidget {
  final String amount;
  const HomeHeaderSection({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImage.homeBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Hey daniel! ",
                        style: TextStyle(
                          fontFamily: "SFpro",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      Text("👋", style: TextStyle(fontSize: 22.sp)),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIcons.bellIcon),
                  ),
                ],
              ),

              SizedBox(height: 30.h),
              Text(
                "Available balance",
                style: TextStyle(
                  fontFamily: "SFpro",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                "₹$amount",
                style: TextStyle(
                  fontFamily: "SFpro",
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 40.h,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add, color: Colors.white, size: 16.sp),
                  label: Text(
                    "Add",
                    style: TextStyle(
                      fontFamily: "SFpro",
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.colorprimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    elevation: 0,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

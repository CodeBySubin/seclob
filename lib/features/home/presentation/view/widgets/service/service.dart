import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seclob/core/constants/app_image.dart';
import 'package:seclob/core/constants/app_style.dart';

// Dummy service model for example
class ServiceItem {
  final String title;
  final String icon;

  ServiceItem({required this.title, required this.icon});
}

final List<ServiceItem> services = [
  ServiceItem(title: "E-card", icon: AppImage.eCard),
  ServiceItem(title: "HR insight", icon: AppImage.insight),
  ServiceItem(title: "Recharge", icon: AppImage.recharge),
  ServiceItem(title: "DTH/Cable", icon: AppImage.dth),
];

class ServicesGrid extends StatelessWidget {
  const ServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Services",
            style: TextStyle(
              fontFamily: 'SFPro',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 1.0,
              letterSpacing: 0,
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 1.9,
            physics: const NeverScrollableScrollPhysics(),
            children:
                services.map((service) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 234, 230, 230),
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(service.icon),
                        SizedBox(width: 15.w),
                        Text(service.title, style: AppStyle.gridText),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}

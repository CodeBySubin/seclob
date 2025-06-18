import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:seclob/features/home/presentation/view/widgets/homepage.dart';
import 'package:seclob/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:seclob/features/profile/presentation/view/profile.dart';

import '../../../../core/constants/constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeViewModel>();

    final List<Widget> widgets = [
      Homepage(),
      const Center(child: Text("Revenue")),
      const Center(child: Text("History")),
      Profile()
    ];

    return Scaffold(
      body: widgets[homeProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 6,
        selectedItemColor: AppColor.colorprimary,
          type: BottomNavigationBarType.fixed, 
        currentIndex: homeProvider.currentIndex,
        onTap: homeProvider.changeIndex,
        items: [
          BottomNavigationBarItem(
            label: AppStrings.home,
            icon: SvgPicture.asset(AppIcons.homeIcon),
          ),
          BottomNavigationBarItem(
            label: AppStrings.revenue,
            icon: SvgPicture.asset(AppIcons.revenueICon),
          ),
          BottomNavigationBarItem(
            label: AppStrings.history,
            icon: SvgPicture.asset(AppIcons.historyIcon),
          ),
          BottomNavigationBarItem(
            label: AppStrings.profile,
            icon: SvgPicture.asset(AppIcons.profileIcon),
          ),
        ],
      ),
    );
  }
}

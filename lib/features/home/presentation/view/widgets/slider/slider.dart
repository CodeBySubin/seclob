import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:seclob/core/constants/app_color.dart';
import 'package:seclob/features/home/presentation/view/widgets/slider/slider_item.dart';
import 'package:seclob/features/home/presentation/viewmodel/home_view_model.dart';

import '../../../../../../core/widgets/widgets.dart';

class CardSlider extends StatelessWidget {
  final List<String> cardImage;
  const CardSlider({super.key, required this.cardImage});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            CarouselSlider(
              items: cardImage.map((e) => CardSliderItem(image: e)).toList(),
              options: CarouselOptions(
                autoPlay:true,
                initialPage: viewModel.sliderIndex,
                onPageChanged: (index, reason) {
                  viewModel.changeSliderIndex(index);
                },
                viewportFraction: 1,
                enableInfiniteScroll: false,
              ),
            ),
            Indicator(
              currentIndex: viewModel.sliderIndex,
              pageLength: cardImage.length,
              activeColor: AppColor.colorprimary,
              color: AppColor.lightGrey,
              spacing: EdgeInsets.symmetric(horizontal: 3.w),
              activeSize: const Size(8.0, 8.0),
              size: const Size(6.0, 6.0),
            ),
          ],
        );
      },
    );
  }
}

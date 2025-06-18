
import 'package:flutter/material.dart';
import 'package:seclob/features/introduction/view/widget/onboarding_footer.dart';
import 'package:onboarding/onboarding.dart';
import 'package:seclob/features/introduction/view/widget/onboarding_items.dart';

import '../../../core/constants/constants.dart';

class Onboardings extends StatelessWidget {
  const Onboardings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        swipeableBody: [
          Boardings(
            title: AppStrings.onboardingTitleOne,
            subTitle: AppStrings.onboardingSubtleOne,
            image: AppImage.onboardingOne,
            highlightText: AppStrings.appTitle,
          ),
          Boardings(
            title: AppStrings.onboardingTitleTwo,
            subTitle: AppStrings.onboardingSubtleTwo,
            image: AppImage.onboardingTwo,
            highlightText: AppStrings.seamlessly,
          ),
          Boardings(
            title: AppStrings.onboardingTitleThree,
            subTitle: AppStrings.onboardingSubtleThree,
            image: AppImage.onboardingThree,
            highlightText: AppStrings.earnings,
          ),
        ],
        buildFooter: (
          context,
          netDragDistance,
          pagesLength,
          currentIndex,
          setIndex,
          slideDirection,
        ) =>
            OnboardingFooter(
          pageLength: pagesLength,
          currentIndex: currentIndex,
          setIndex: setIndex, 
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/const_colors.dart';
import '../screens/onboarding_screen/onboarding_controller.dart';

class CustomNavigationDots extends StatelessWidget {
  const CustomNavigationDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
        bottom: 18.h,
        left: 40.w,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: ConstColor.primaryColor.value,
              dotHeight: 10,
              dotWidth: 10),
        ));
  }
}
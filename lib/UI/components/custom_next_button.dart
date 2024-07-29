import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/const_colors.dart';
import '../../core/constants/cosnt_styles.dart';
import '../screens/onboarding_screen/onboarding_controller.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 6.h,
      right: 15.w,
      left: 15.w,
      child: GestureDetector(
        onTap: () => OnBoardingController.instance.nextPage(),
        child: Container(
          height: 5.h,
          decoration: BoxDecoration(
            color: ConstColor.primaryColor.value,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
                'Next',
                style: smallTextStyle,
              )),
        ),
      ),
    );
  }
}
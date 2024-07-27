import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../screens/onboarding_screen/onboarding_controller.dart';

class CustomSkipButton extends StatelessWidget {
  const CustomSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 3.h,
        right: 5.w,
        child: TextButton(
            onPressed: () => OnBoardingController.instance.skipPage(),
            child: const Text('Skip')));
  }
}
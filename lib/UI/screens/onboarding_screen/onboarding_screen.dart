
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/cosnt_texts.dart';
import '../../../generated/assets.dart';
import '../../components/custom_nav_dots.dart';
import '../../components/custom_next_button.dart';
import '../../components/custom_onboarding_screen.dart';
import '../../components/custom_skip_button.dart';
import 'onboarding_controller.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                OnBoardingPage(
                  image: Assets.onbaording_pic_1,
                  title: onBoardingTitle1,
                  subtitle: onBoardingDes,
                ),
                OnBoardingPage(
                  image: Assets.onbaording_pic_2,
                  title: onBoardingTitle2,
                  subtitle: onBoardingDes,
                ),
                OnBoardingPage(
                  image: Assets.onbaording_pic_3,
                  title: onBoardingTitle3,
                  subtitle: onBoardingDes,
                ),
              ],
            ),
            const CustomSkipButton(),
            const CustomNavigationDots(),
            const CustomNextButton(),
          ],
        ),
      ),
    );
  }
}


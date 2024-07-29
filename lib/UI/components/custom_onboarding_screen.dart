import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/cosnt_styles.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 0.5.h),
      child: Column(
        children: [
          Image(
              width: 100.w,
              height:50.h,
              image: AssetImage(image)),
          Text(
            title,
            style: primaryTextStyle,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
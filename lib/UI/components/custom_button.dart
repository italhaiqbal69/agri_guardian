import 'package:agri_guardian/core/constants/const_colors.dart';
import 'package:agri_guardian/core/constants/cosnt_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const CustomButton({
    required this.title,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h, left: 28.w, right: 28.w),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 7.h,
          decoration: BoxDecoration(
            color: ConstColor.primaryColor.value,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: Text(
                title,
                style: primaryTextStyle.copyWith(color: ConstColor.kWhite.value),
              )),
        ),
      ),
    );
  }
}

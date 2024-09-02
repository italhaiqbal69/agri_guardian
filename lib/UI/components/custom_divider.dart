import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Custom_divider extends StatelessWidget {
  const Custom_divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: Divider(
        height: 2.h,
        indent: 20,
        endIndent: 20,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/const_colors.dart';

class Profile_Row extends StatelessWidget {
  String title;
  String subtitle;

  Profile_Row({
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 7.h, right: 6.w, left: 6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.zenAntique(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ConstColor.primaryColor.value),
          ),
          Text(
            subtitle,
            style: GoogleFonts.zenAntique(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: ConstColor.kblack.value),
          ),
        ],
      ),
    );
  }
}

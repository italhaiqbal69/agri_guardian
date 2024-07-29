import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'const_colors.dart';

var primaryTextStyle = GoogleFonts.overpass(
    color: ConstColor.primaryColor.value, fontSize: 24, fontWeight: FontWeight.w900);

var mediumtextStyle = GoogleFonts.poppins(
    color: ConstColor.kgrey.value,
    fontSize: 26.sp,
    fontWeight: FontWeight.w700);

var smallTextStyle = GoogleFonts.inter(
    color: ConstColor.kWhite.value,
    fontSize: 17.sp,
    fontWeight: FontWeight.w700);
var buttonTextStyle = GoogleFonts.inter(
  color: ConstColor.kWhite.value,
  fontSize: 17.sp,
  fontWeight: FontWeight.w600,
);

var moreSmallText = GoogleFonts.poppins(
  color: ConstColor.primaryColor.value,
  fontSize: 15.sp,
  fontWeight: FontWeight.w400,
);


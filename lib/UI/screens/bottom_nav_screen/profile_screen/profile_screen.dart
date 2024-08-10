import 'package:agri_guardian/core/constants/const_colors.dart';
import 'package:agri_guardian/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Container(
              height: 20.h,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.splash_logo)),
                shape: BoxShape.circle,
                border: Border.all(color: ConstColor.kblack.value),
              ),
            ),
          ),
          Profile_Row(
            title: 'UserName:',
            subtitle: 'Talha Iqbal',
          ),
          Custom_divider(),
          Profile_Row(
            title: 'Email:',
            subtitle: 'italhaiqbal200',
          ),
          Custom_divider(),
          Profile_Row(
            title: 'Phone:',
            subtitle: '0349-150131-1',
          ),
          Custom_divider(),
          Profile_Row(
            title: 'Address:',
            subtitle: 'Peshawar Pakistan',
          ),
          Custom_divider(),
        ],
      ),
    );
  }
}

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
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: ConstColor.kblack.value),
          ),
        ],
      ),
    );
  }
}

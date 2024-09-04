import 'package:agri_guardian/UI/screens/Wheat_disease_detection/Wheat_disease_detector.dart';
import 'package:agri_guardian/UI/screens/bottom_nav_screen/dashboard_screen/dashboard_controller.dart';
import 'package:agri_guardian/core/constants/const_colors.dart';
import 'package:agri_guardian/generated/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController _dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 35.h,
              ),
              Container(
                height: 30.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.dashboard_pic),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
              ),
              Positioned(
                top: 26.h,
                left: 10.w,
                right: 10.w,
                child: Container(
                  height: 7.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    'YOUR FARMING AI!',
                    style: GoogleFonts.zenAntique(
                      fontSize: 19,
                      color: Colors.green,
                    ),
                  )),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: Text(
                textAlign: TextAlign.center,
                'Welcome Back Sir!\nWhich Crop would you want to Diagnose?',
                style: GoogleFonts.zenAntique(fontSize: 22)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => Wheat_model_screen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ConstColor.primaryColor.value.withOpacity(0.5),
                      border: Border.all(color: ConstColor.kblack.value),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            Assets.wheat_pic,
                            height: 20.h,
                            width: 40.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: Text(
                              'Wheat',
                              style: GoogleFonts.zenAntique(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ConstColor.primaryColor.value.withOpacity(0.5),
                    border: Border.all(color: ConstColor.kblack.value),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          Assets.sugar_cane_pic,
                          height: 20.h,
                          width: 40.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Text(
                            'Sugar Cane',
                            style: GoogleFonts.zenAntique(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

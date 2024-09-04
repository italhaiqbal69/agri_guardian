import 'dart:async';

import 'package:agri_guardian/UI/screens/auth/login_screen/login_screen.dart';
import 'package:agri_guardian/UI/screens/bottom_nav_screen/bottom_nav_screen.dart';

import 'package:agri_guardian/generated/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    Timer(
        const Duration(seconds: 3),
        () => Get.offAll(() =>
            user != null ? const BottomNavbarScreen() : const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Image.asset(
          Assets.splash_logo,
          height: 35.h,
        )),
      ),
    );
  }
}

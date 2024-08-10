import 'package:agri_guardian/UI/components/custom_button.dart';
import 'package:agri_guardian/UI/components/custom_text_feild.dart';
import 'package:agri_guardian/UI/screens/auth/login_screen/login_controller.dart';
import 'package:agri_guardian/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/cosnt_styles.dart';
import '../../../../generated/assets.dart';
import '../../../components/account_row.dart';
import '../../bottom_nav_screen/bottom_nav_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                Assets.logIn_pic,
                height: 40.h,
              ),
              Text(
                'Login',
                style: primaryTextStyle,
              ),
              Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: GoogleFonts.poppins(
                      color: ConstColor.kblack.value,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              CustomTextfield(
                controller: _loginController.emailController,
                hint: 'Enter email',
                icon: Icons.email,
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h, left: 7.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: GoogleFonts.poppins(
                      color: ConstColor.kblack.value,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              CustomTextfield(
                controller: _loginController.passwordController,
                hint: 'Enter password',
                icon: Icons.password,
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, right: 7.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password?',
                    style: GoogleFonts.poppins(
                      color: ConstColor.kblack.value,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              CustomButton(
                onPress: () {
                  Get.offAll(() => const BottomNavbarScreen());
                },
                title: 'Login',
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Text(
                  'OR',
                  style:
                      smallTextStyle.copyWith(color: ConstColor.kblack.value),
                ),
              ),
              Account_Row(),
              Padding(
                padding: EdgeInsets.only(top: 1.h, left: 10.w, right: 10.w),
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: ConstColor.primaryColor.value,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        Assets.google_pic,
                        height: 30,
                      ),
                      Text(
                        'Login with Google',
                        style: mediumtextStyle.copyWith(
                            color: ConstColor.kWhite.value,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

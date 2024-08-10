import 'package:agri_guardian/UI/screens/auth/signup_screen/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_colors.dart';
import '../../../../core/constants/cosnt_styles.dart';
import '../../../../generated/assets.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_feild.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.put(SignupController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              Assets.signup_pic,
              height: 40.h,
            ),
            Text(
              'Signup',
              style: primaryTextStyle,
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: GoogleFonts.poppins(
                    color: ConstColor.kblack.value,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            CustomTextfield(
              controller: signupController.emailController,
              hint: 'Enter Username',
              icon: Icons.email,
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h, left: 7.w),
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
              controller: signupController.passwordController,
              hint: 'Enter Email',
              icon: Icons.password,
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h, left: 7.w),
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
              controller: signupController.passwordController,
              hint: 'Enter password',
              icon: Icons.password,
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h, left: 7.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Phone',
                  style: GoogleFonts.poppins(
                    color: ConstColor.kblack.value,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            CustomTextfield(
              controller: signupController.passwordController,
              hint: 'Enter Phone',
              icon: Icons.password,
            ),
             CustomButton(
              onPress: (){},
              title: 'Signup',
            ),
          ],
        ),
      ),
    );
  }
}

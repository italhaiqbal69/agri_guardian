import 'package:agri_guardian/UI/screens/auth/signup_screen/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/const_colors.dart';
import '../../core/constants/cosnt_styles.dart';

class Account_Row extends StatelessWidget {
  const Account_Row({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Row(
        children: [
          Text(
            'Dont have account?',
            style: smallTextStyle.copyWith(
                color: ConstColor.kblack.value,
                fontWeight: FontWeight.w100,
                fontSize: 14),
          ),
          GestureDetector(
            onTap: (){
              Get.to(()=>const SignupScreen());
            },

            child: Text(
              'Signup',
              style:
              smallTextStyle.copyWith(color: ConstColor.primaryColor.value),
            ),
          ),
        ],
      ),
    );
  }
}

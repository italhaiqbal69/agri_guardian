import 'package:agri_guardian/UI/screens/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginUser() async {
    try {
      final User? FirebaseUser = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim()))
          .user;
      if (FirebaseUser != null) {
        Get.to(() => BottomNavbarScreen());
      } else {
        print('check email and password');
      }
    } on FirebaseAuthException catch (e) {
      print("error $e");
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../login_screen/login_screen.dart';

class SignupController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  SignUpUser(String userEmail, String userPassword, String userName,
      String userPhone) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .set({
        'userName': userName,
        'userPhone': userPhone,
        'userEmail': userEmail,
        'create At': DateTime.now(),
        'userId': currentUser!.uid,
        'Profile_pic':'',
      }).then((value) => {
                FirebaseAuth.instance.signOut(),
                Get.to(() => LoginScreen()),
              });
    } on FirebaseAuthException catch (e) {
      print("error $e");
    }
  }

  createUser() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((value) => {
              SignUpUser(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                  usernameController.text.trim(),
                  phoneNumberController.text.trim())
            });
  }
}

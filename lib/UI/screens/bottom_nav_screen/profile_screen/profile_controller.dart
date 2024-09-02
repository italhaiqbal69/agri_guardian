import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_colors.dart';
import '../../../../generated/assets.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_profile_row.dart';

class ProfileController extends GetxController {

  void PickerFunction() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    print(file!.path);




  }
}

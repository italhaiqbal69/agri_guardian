import 'dart:io';

import 'package:agri_guardian/UI/screens/bottom_nav_screen/profile_screen/profile_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_colors.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_profile_row.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? userid = FirebaseAuth.instance.currentUser;
  String imageUrl = '';
  String userDocId = '';

  @override
  Widget build(BuildContext context) {
    final ProfileController userProfileController =
        Get.put(ProfileController());
    return Scaffold(
      body: Container(
        height: 100.h,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('userId', isEqualTo: userid!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Error');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (snapshot.data!.docs.isEmpty) {
                return const Text('No data found');
              }
              if (snapshot != null && snapshot.data != null) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, Index) {
                      var data = snapshot.data!.docs[Index];
                      userDocId = data.id;
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 30.h,
                                ),
                                Positioned(
                                  top: 10,
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                  child: Container(
                                    height: 10.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        shape: BoxShape.circle),
                                    child: data['Profile_pic'] == null
                                        ? Icon(Icons.photo)
                                        : Container(
                                            height: 10.h,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      data['Profile_pic']
                                                          .toString())),
                                            ),
                                          ),
                                  ),
                                ),
                                Positioned(
                                  top: 170,
                                  left: 180,
                                  right: 2,
                                  child: InkWell(
                                    onTap: () {
                                      PickerFunction();
                                    },
                                    child: Container(
                                      height: 6.h,
                                      decoration: BoxDecoration(
                                        color: ConstColor.primaryColor.value,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.camera_alt),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Profile_Row(
                              title: 'UserName:',
                              subtitle: data['userName'],
                            ),
                            Custom_divider(),
                            Profile_Row(
                              title: 'Email:',
                              subtitle: data['userEmail'],
                            ),
                            Custom_divider(),
                            Profile_Row(
                              title: 'Phone:',
                              subtitle: data['userPhone'],
                            ),
                          ],
                        ),
                      );
                    });
              }

              return CircularProgressIndicator();
            }),
      ),
    );
  }

  void PickerFunction() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    print(file!.path);
    if (file!.path == null) return;

    String uniqueFilename = DateTime.now().millisecondsSinceEpoch.toString();

    Reference referenceRoot = FirebaseStorage.instance.ref();

    Reference referenceDirImages = referenceRoot.child('Profile Images');

    Reference imageToUpload = referenceDirImages.child(uniqueFilename);

    try {
      await imageToUpload.putFile(File(file!.path));
      imageUrl = await imageToUpload.getDownloadURL();
      print(imageUrl);
    } catch (e) {
      print(e);
    }
    FirebaseFirestore.instance
        .collection('users')
        .doc(userDocId.toString())
        .update({
      'Profile_pic': imageUrl,
    }).then(
      (value) {
        print("photo uploaded succesfully");
      },
    );
  }
}

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_nav_controller.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  BottomNavbarController controller = Get.put(BottomNavbarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => Container(
        child: BottomBarInspiredOutside(
          items: controller.items,
          backgroundColor: Colors.white,
          color: Colors.grey,
          colorSelected: Colors.white,
          top: -28,
          animated: true,
          itemStyle: ItemStyle.circle,
          isAnimated: true,
          chipStyle: const ChipStyle(
            notchSmoothness: NotchSmoothness.sharpEdge,
            background:  Color(0xff8AC926),
          ),
          indexSelected: controller.currentIndex.value,
          onTap: (index) {
            controller.changeIndex(index);
          },
        ),
      )),
    );
  }
}
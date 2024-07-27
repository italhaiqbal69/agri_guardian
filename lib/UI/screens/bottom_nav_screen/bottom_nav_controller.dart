import 'package:agri_guardian/UI/screens/bottom_nav_screen/agri_ai_screen/agri_ai_screen.dart';
import 'package:agri_guardian/UI/screens/bottom_nav_screen/profile_screen/profile_screen.dart';
import 'package:agri_guardian/UI/screens/bottom_nav_screen/weather_screen/weather_screen.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_screen/dashboard_screen.dart';

class BottomNavbarController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> screens = [
    DashboardScreen(),
    AgriAiScreen(),
    WeatherScreen(),
    ProfileScreen(),
  ];

  final List<TabItem> items = [
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.adb, title: 'Ai'),
    TabItem(icon: Icons.ac_unit_rounded, title: 'Weather'),
    TabItem(icon: Icons.account_circle_outlined, title: 'Profile'),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}

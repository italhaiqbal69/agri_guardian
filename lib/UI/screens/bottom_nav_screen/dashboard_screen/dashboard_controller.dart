import 'package:agri_guardian/generated/assets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardController extends GetxController {
  List<Map<String, dynamic>> plantsCategory = [
    {'image': Assets.wheat_pic, 'name': 'Wheat'},
    {'image': Assets.sugar_cane_pic, 'name': 'SugarCane'}
  ];
}

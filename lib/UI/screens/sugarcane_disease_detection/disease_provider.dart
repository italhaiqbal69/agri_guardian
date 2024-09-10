import 'package:flutter/material.dart';

import 'disease_model.dart';

class sugarCaneDiseaseDetectorProvider with ChangeNotifier {
  late SugarCaneDisease _diseaseModel;

  SugarCaneDisease get disease => _diseaseModel;

  void setDiseaseStatus(SugarCaneDisease diseaseModel) {
    _diseaseModel = diseaseModel;
    notifyListeners();
  }
}

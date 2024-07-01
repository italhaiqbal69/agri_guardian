import 'package:flutter/material.dart';

import 'disease_model.dart';

class DiseaseProvider with ChangeNotifier {
  late DiseaseModel _diseaseModel;

  DiseaseModel get disease => _diseaseModel;

  void setDiseaseStatus(DiseaseModel diseaseModel) {
    _diseaseModel = diseaseModel;
    notifyListeners();
  }
}

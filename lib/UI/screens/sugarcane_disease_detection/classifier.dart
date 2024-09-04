import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:image/image.dart' as image_lib;

class Classifier {
  late File imageFile;
  late List outputs;
  late tfl.Interpreter interpreter;

  bool checkImageIsPng(String path) {
    if (path.contains(".png")) {
      return true;
    } else {
      return false;
    }
  }

  String convertPngToJpg(String inputPath, String outputPath) {
    final File inputFile = File(inputPath);
    if (!inputFile.existsSync()) {
      debugPrint('Input file does not exist!');
      return '';
    }

    List<int> bytes = inputFile.readAsBytesSync();
    image_lib.Image? image = image_lib.decodeImage(Uint8List.fromList(bytes));

    if (image != null) {
      File(outputPath).writeAsBytesSync(image_lib.encodeJpg(image));
      return outputPath;
    } else {
      debugPrint('Failed to decode PNG image');
      return '';
    }
  }

  Future<Map<String, dynamic>> getDisease(
      String path, List<String> classNames) async {
    if (checkImageIsPng(path)) {
      path = convertPngToJpg(path, path.replaceAll(".png", ".jpg"));
    }
    imageFile = File(path);
    int noOfClasses = 3;

    // await loadModel();
    var value = await classifyImage(imageFile, noOfClasses);
    interpreter.close();

    print("VALUE: $value");

    int maxIndex = value![0].indexOf(value[0]
        .reduce((double curr, double next) => curr > next ? curr : next));

    String predictedClass = classNames[maxIndex];
    double confidence = value[0][maxIndex];

    debugPrint("Predicted Class: $predictedClass");
    debugPrint("Confidence: $confidence");

    return {"label": predictedClass, "confidence": confidence};
  }

  loadModel() async {
    interpreter =
        await tfl.Interpreter.fromAsset('assets/wheatModel/wheatModel.tflite');
    print('loaded');
  }

  Future<List?> classifyImage(File image, int noOfClasses) async {
    try {
      var img = image_lib.decodeImage(image.readAsBytesSync());
      var resizedImg = image_lib.copyResize(img!, width: 256, height: 256);
      var imgBytes = resizedImg.getBytes();
      var floatImgBytes = imgBytes.map((byte) => byte / 255.0).toList();
      var input = floatImgBytes.reshape([1, 256, 256, 3]);
      var output = List.filled(
          1,
          List.filled(noOfClasses,
              0.0)); // Adjusted to shape [1, noOfClasses] for the number of classes

      interpreter.run(input, output);
      debugPrint("output$output");
      return output;
    } catch (e) {
      return null;
    }
  }
}

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import 'classifier.dart';
import 'disease_model.dart';
import 'disease_provider.dart';

class sugarcane_disese_detector extends StatefulWidget {
  const sugarcane_disese_detector({super.key});

  @override
  State<sugarcane_disese_detector> createState() =>
      _sugarcane_disese_detectorState();
}

class _sugarcane_disese_detectorState extends State<sugarcane_disese_detector> {
  File? file;
  final Classifier classifier = Classifier();
  late SugarCaneDisease diseaseModel;

  List<String> classNames = ['Healthy', 'Bacterial Blight', 'Red Rot'];

  void getDiseasetatus(sugarCaneDiseaseDetectorProvider diseaseProvider) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(image!.path);
    });

    print("IMAGE");

    if (file == null) {
      return;
    }
    print("IMAGE PATH: ${file!.path}");

    bool isLoading = false;

    if (file != null) {
      setState(() {
        isLoading = true;
      });

      late double confidence;
      await classifier.getDisease(file!.path, classNames).then((value) {
        debugPrint(value.toString());

        diseaseModel = SugarCaneDisease(
            name: value["label"], imagePath: classifier.imageFile.path);

        confidence = value['confidence'];
      });

      // Check confidence
      if (confidence > 0.05) {
        diseaseProvider.setDiseaseStatus(diseaseModel);

        // if (diseaseModel.name == "no_tumor") {
        //   if (!mounted) return;
        //   setState(() {
        //     isLoading = false;
        //     _outputText = "No disease detected.";
        //   });
        //   return;
        // }
        if (!mounted) return;
        setState(() {
          isLoading = false;
          _outputText = "Disease detected: ${diseaseModel.name}";
        });
      } else {
        // Display unsure message
      }
    }
  }

  String _outputText = "Please pick an image."; // Initial text

  @override
  void initState() {
    super.initState();
    classifier.loadModel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (file != null)
              Image.file(
                file!,
                width: 200,
                height: 200,
              )
            else
              const Text('No image selected'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final vm = Provider.of<sugarCaneDiseaseDetectorProvider>(
                    context,
                    listen: false);
                getDiseasetatus(vm);
              },
              child: const Text('Pick Image from Gallery'),
            ),
            const SizedBox(height: 20),
            Text(_outputText),
          ],
        ),
      ),
    );
  }
}

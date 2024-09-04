import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import 'classifier.dart';
import 'disease_model.dart';
import 'disease_provider.dart';

class Wheat_model_screen extends StatefulWidget {
  const Wheat_model_screen({super.key});

  @override
  State<Wheat_model_screen> createState() => _Wheat_model_screenState();
}

class _Wheat_model_screenState extends State<Wheat_model_screen> {
  File? file;
  final Classifier classifier = Classifier();
  late DiseaseModel diseaseModel;

  List<String> classNames = ['Healthy', 'septoria', 'stripe_rust'];

  void getDiseasetatus(DiseaseProvider diseaseProvider) async {
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

        diseaseModel = DiseaseModel(
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
                final vm = Provider.of<DiseaseProvider>(context, listen: false);
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

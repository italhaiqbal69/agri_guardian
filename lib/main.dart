import 'package:agri_guardian/UI/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/constants/cosnt_texts.dart';
import 'models/disease_provider.dart';

void main() {
  Gemini.init(apiKey: API_KEY,);
  runApp(ResponsiveSizer(builder: (context, orientation, screenType) {
    return const MyApp();
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DiseaseProvider()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

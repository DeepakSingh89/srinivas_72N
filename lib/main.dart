import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'app/core/resources/app_resources.dart';
import 'app/routes/app_pages.dart';

SpeechToText speechToText = SpeechToText();
bool speechEnabled = false;

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  try {
    speechEnabled = await speechToText.initialize();
  } catch (e) {
    log("e $e");
  }
  log("enabled $speechEnabled");
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: themeColor,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GetMaterialApp(
          title: 'Direct2U',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch:
                    MaterialColor(themeColor.value, materialColorMap),
              ),
              primarySwatch: MaterialColor(themeColor.value, materialColorMap),
              scaffoldBackgroundColor: Colors.white),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ));
  }
}

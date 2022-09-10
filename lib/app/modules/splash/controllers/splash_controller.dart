import 'dart:developer';

import 'package:direct2u/app/data/datasources/local/app_database.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final duration = 4;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: duration), () {
      log("token ${LocalStorage.readToken()}");
      if (LocalStorage.readToken().isEmpty) {
        Get.offNamed(Routes.WELCOME);
      } else {
        Get.offNamed(Routes.MAIN);
      }
    });
  }
}

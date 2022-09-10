import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:get/get.dart';

class TncController extends GetxController {
  final description = "".obs;

  @override
  void onInit() {
    super.onInit();
    getTNC();
  }

  getTNC() async {
    buildDialogLoadingIndicator();
    try {
      description.value =
          (await cmsRepository.getTnc()).data?.description ?? "";
      Get.back();
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }
}

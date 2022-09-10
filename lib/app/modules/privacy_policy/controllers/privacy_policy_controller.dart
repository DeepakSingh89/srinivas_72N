import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/utils/app_repositories.dart';
import '../../../core/utils/app_widgets.dart';

class PrivacyPolicyController extends GetxController {
  final description = "".obs;

  @override
  void onInit() {
    super.onInit();
    getPrivacyPolicy();
  }

  getPrivacyPolicy() async {
    buildDialogLoadingIndicator();
    try {
      description.value =
          (await cmsRepository.getPrivacyPolicy()).data?.description ?? "";
      Get.back();
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }
}

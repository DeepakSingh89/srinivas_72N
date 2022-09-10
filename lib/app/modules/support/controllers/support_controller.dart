import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/domain/params/cms/add_cms_params.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  final TextEditingController name = TextEditingController();

  final TextEditingController query = TextEditingController();
  final TextEditingController email = TextEditingController();

  final TextEditingController contactno = TextEditingController();

  postHelpSupport() async {
    try {
      if (name.text.isBlank == true ||
          query.text.isBlank == true ||
          contactno.text.isBlank == true ||
          email.text.isBlank == true) {
        showToastMessage(title: "Error", message: "Fields required");
        return;
      }
      buildDialogLoadingIndicator();
      final params = AddCmsParams(
          name: name.text,
          query: query.text,
          email: email.text,
          mobile: contactno.text);

      final response = (await cmsRepository.addHelpSupport(params)).data;
      Get.back();
      if (response != null) {
        showToastMessage(title: "Success", message: "Submitted successfully");
      }
    } catch (er) {
      log("er $er");
      Get.back();
    }
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/entities/user/get_profile_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final count = 0.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final file = File("").obs;
  final profilePicUrl = "".obs;
  final getProfileResponse = GetProfileResponse().obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  final loading = false.obs;

  updateProfile() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      showToastMessage(title: "Error", message: "Fields required");
      return;
    }
    loading.value = true;
    try {
      final response = (await userRepository.updateProfile(nameController.text,
          emailController.text, file.value.path.isEmpty ? null : file.value));
      loading.value = false;
      log("response: $response");
      if (response.data != null) {
        Get.back(result: true);
        showToastMessage(
            title: "Success", message: "Profile updated successfully");
      }
    } catch (e) {
      log("e $e");
      loading.value = false;
    }
  }

  getProfile() async {
    try {
      getProfileResponse.value = Get.arguments;
      nameController.text = getProfileResponse.value.name ?? "";
      emailController.text = getProfileResponse.value.email ?? "";
      phoneController.text = getProfileResponse.value.mobile ?? "";
      profilePicUrl.value = getProfileResponse.value.avatar ?? "";
    } catch (e) {
      log("e $e");
    }
  }

  void increment() => count.value++;
}

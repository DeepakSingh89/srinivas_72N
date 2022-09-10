import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:get/get.dart';

import '../../../domain/entities/user/get_profile_response.dart';

class ProfileController extends GetxController {
  final getProfileResponse = GetProfileResponse().obs;
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  getProfile() async {
    try {
      loading.value = true;
      getProfileResponse.value =
          (await userRepository.getProfile()).data ?? GetProfileResponse();
      loading.value = false;
    } catch (e) {
      log("e $e");
    }
  }
}

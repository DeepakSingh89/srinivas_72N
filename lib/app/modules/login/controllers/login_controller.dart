import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/data/datasources/local/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_utils.dart';
import '../../../domain/params/auth/login_params.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController mobile = TextEditingController();
  final TextEditingController password = TextEditingController();
  final isLoading = false.obs;

  login() async {
    if (mobile.text.isEmpty || password.text.isEmpty) {
      showToastMessage(title: "Error", message: "Fields required");
      return;
    }
    final params = LoginParams();
    params.mobile = mobile.text;
    params.password = password.text;
    isLoading.value = true;

    try {
      final response = await authRepository.login(params);
      isLoading.value = false;
      if (response.data != null) {
        showToastMessage(title: "Success", message: "Login Successful!");
        LocalStorage.saveToken(response.data?.token ?? "");
        CommonRepository.setApiService();
        Get.offAllNamed(Routes.MAIN);
      }
    } catch (e) {
      log("e $e");
      isLoading.value = false;
    }
  }

  Future<void> facebookLogin() async {
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: (['email', 'public_profile']));
      final token = result.accessToken?.token;
      if (token != null) {
        buildDialogLoadingIndicator();
        log('Facebook token userID : $token');
        final response = await authRepository.fbLogin(token);
        if (response.data != null) {
          showToastMessage(title: "Success", message: "Login Successful!");
          LocalStorage.saveToken(response.data?.token ?? "");
          CommonRepository.setApiService();
          Get.offAllNamed(Routes.MAIN);
        }
      }
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }
}

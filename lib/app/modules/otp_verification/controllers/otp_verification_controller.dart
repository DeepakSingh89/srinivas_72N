import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/data/datasources/local/app_database.dart';
import 'package:direct2u/app/domain/params/auth/verify_otp_for_register_params.dart';
import 'package:direct2u/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  late VerifyOtpForRegisterParams verifyParams;
  final TextEditingController otp1 = TextEditingController();
  final TextEditingController otp2 = TextEditingController();
  final TextEditingController otp3 = TextEditingController();
  final TextEditingController otp4 = TextEditingController();
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    verifyParams = Get.arguments;
    var characters = verifyParams.otpEnterByUser?.characters;
    otp1.text = characters?.elementAt(0) ?? "";
    otp2.text = characters?.elementAt(1) ?? "";
    otp3.text = characters?.elementAt(2) ?? "";
    otp4.text = characters?.elementAt(3) ?? "";
    verifyOTP();
  }

  verifyOTP() async {
    if (otp1.text.isEmpty ||
        otp2.text.isEmpty ||
        otp3.text.isEmpty ||
        otp4.text.isEmpty) {
      showToastMessage(title: "Error", message: "Fields required");
      return;
    }
    loading.value = true;
    try {
      final response = await authRepository.verifyOTPForRegister(verifyParams);
      loading.value = false;
      if (response.data?.token != null) {
        showToastMessage(title: "Success", message: "Verification Successful!");
        LocalStorage.saveToken(response.data?.token ?? "");
        CommonRepository.setApiService();
        Get.offAllNamed(Routes.MAIN);
      } else {
        showToastMessage(title: "Error", message: "Something went wrong");
      }
    } catch (e) {
      log("e $e");
      loading.value = false;
    }
  }
}

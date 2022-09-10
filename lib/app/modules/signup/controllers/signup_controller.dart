import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/params/auth/send_otp_for_register_params.dart';
import 'package:direct2u/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../domain/params/auth/verify_otp_for_register_params.dart';

class SignupController extends GetxController {
  final count = 0.obs;
  final loading = false.obs;
  final TextEditingController mobile = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  sendOTP() async {
    if (mobile.text.isEmpty ||
        password.text.isEmpty ||
        confirmPassword.text.isEmpty) {
      showToastMessage(title: "Error", message: "Fields required");
      return;
    }
    if (password.text != confirmPassword.text) {
      showToastMessage(title: "Error", message: "Password does not match");
      return;
    }
    loading.value = true;
    final params = SendOtpForRegisterParams();
    params.mobile = mobile.text;
    params.pswd1 = password.text;
    params.pswd2 = confirmPassword.text;

    try {
      final response = await authRepository.sendOTPforRegister(params);
      log("response ${response.data}");
      loading.value = false;
      final VerifyOtpForRegisterParams verifyparams =
          VerifyOtpForRegisterParams();
      verifyparams.mobile = mobile.text;
      verifyparams.otpEnterByUser = response.data?.otp;
      verifyparams.password = password.text;
      if (response.data != null) {
        showToastMessage(
            title: "Success",
            message: "OTP Send to your number ${mobile.text}");
        Get.toNamed(Routes.OTP_VERIFICATION, arguments: verifyparams);
      }
    } catch (e) {
      log("e $e");
      loading.value = false;
    }
  }

  void increment() => count.value++;
}

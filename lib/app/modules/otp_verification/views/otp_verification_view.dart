import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../gen/assets.gen.dart';
import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.heightBox,
            Image.asset(Assets.images.otp.path),
            20.heightBox,
            "OTP Verification".text.size(26).bold.make(),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Enter the OTP sent to".text.make(),
                5.widthBox,
                "+91 ${controller.verifyParams.mobile}".text.bold.make()
              ],
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildOTPField(
                  controller: controller.otp1,
                ),
                5.widthBox,
                BuildOTPField(
                  controller: controller.otp2,
                ),
                5.widthBox,
                BuildOTPField(
                  controller: controller.otp3,
                ),
                5.widthBox,
                BuildOTPField(
                  controller: controller.otp4,
                ),
              ],
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Didn't you receive the OTP?".text.make(),
                5.widthBox,
                "Resend OTP".text.blue600.make(),
              ],
            ),
            20.heightBox,
            Obx(() {
              return controller.loading.isTrue
                  ? const ButtonLoading()
                  : ButtonPrimary(
                      title: "Submit",
                      onPressed: () {
                        controller.verifyOTP();
                      });
            })
          ],
        ),
      ),
    );
  }
}

class BuildOTPField extends StatelessWidget {
  const BuildOTPField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return VxTextField(
      keyboardType: TextInputType.number,
      maxLength: 1,
      controller: controller,
      borderType: VxTextFieldBorderType.roundLine,
      borderRadius: 8,
      clear: false,
      textAlign: TextAlign.center,
      borderColor: Vx.gray400,
      counterText: "",
    ).w(50).h(50);
  }
}

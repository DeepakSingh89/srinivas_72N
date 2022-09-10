import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/utils/app_widgets.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.heightBox,
                "Register".text.size(32).bold.make(),
                10.heightBox,
                VxTextField(
                  hint: "Mobile no.",
                  fillColor: Colors.transparent,
                  controller: controller.mobile,
                ),
                20.heightBox,
                VxTextField(
                  hint: "Password",
                  fillColor: Colors.transparent,
                  isPassword: true,
                  controller: controller.password,
                ),
                20.heightBox,
                VxTextField(
                    hint: "Verify Password",
                    fillColor: Colors.transparent,
                    controller: controller.confirmPassword,
                    isPassword: true),
                20.heightBox,
                Obx(() {
                  return controller.loading.isTrue
                      ? const ButtonLoading()
                      : ButtonPrimary(
                          title: "Register",
                          onPressed: () {
                            controller.sendOTP();
                          });
                }),
                80.heightBox,
                "By creating an account, you are agreeing to our"
                    .text
                    .size(12)
                    .make()
                    .centered(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    "Terms and Services".text.blue600.size(12).make(),
                    5.widthBox,
                    "and".text.size(12).make(),
                    5.widthBox,
                    "Privacy Policy".text.blue600.size(12).make()
                  ],
                ).centered()
              ],
            ).marginAll(10),
          ),
        ));
  }
}

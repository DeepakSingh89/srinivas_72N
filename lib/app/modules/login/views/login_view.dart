import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/utils/app_widgets.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
                "Login".text.size(32).bold.make(),
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
                    controller: controller.password),
                // 10.heightBox,
                // Row(
                //   children: [const Spacer(), "Forget Password?".text.make()],
                // ),
                20.heightBox,
                Obx(() => controller.isLoading.isTrue
                    ? const ButtonLoading()
                    : ButtonPrimary(
                        title: "Login",
                        onPressed: () {
                          controller.login();
                        })),
                30.heightBox,
                Row(
                  children: [
                    const VxDivider().expand(),
                    10.widthBox,
                    "or".text.make(),
                    10.widthBox,
                    const VxDivider().expand(),
                  ],
                ),
                30.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.images.google.path),
                    20.widthBox,
                    Image.asset(Assets.images.facebook.path).onInkTap(() {
                      controller.facebookLogin();
                    })
                  ],
                ),
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

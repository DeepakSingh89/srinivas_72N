import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.heightBox,
            Image.asset(Assets.images.logo.path,
                    width: 300, height: 200, fit: BoxFit.cover)
                .centered(),
            50.heightBox,
            "Welcome".text.size(32).bold.make(),
            10.heightBox,
            Faker().lorem.sentence().text.make(),
            10.heightBox,
            ButtonPrimary(
                title: "SignUp",
                onPressed: () {
                  Get.toNamed(Routes.SIGNUP);
                }),
            5.heightBox,
            ButtonSecondary(
                title: "Log In",
                onPressed: () {
                  Get.toNamed(Routes.LOGIN);
                }),
            // 80.heightBox,
            // "By creating an account, you are agreeing to our"
            //     .text
            //     .size(12)
            //     .make()
            //     .centered(),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     "Terms and Services".text.blue600.size(12).make(),
            //     5.widthBox,
            //     "and".text.size(12).make(),
            //     5.widthBox,
            //     "Privacy Policy".text.blue600.size(12).make()
            //   ],
            // ).centered()
          ],
        ).marginAll(10),
      ),
    ));
  }
}

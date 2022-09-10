import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Privacy Policy"),
      body: SingleChildScrollView(child: Obx(() {
        return controller.description.value.text.make().marginAll(10);
      })),
    );
  }
}

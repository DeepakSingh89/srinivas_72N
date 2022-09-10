import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/tnc_controller.dart';

class TncView extends GetView<TncController> {
  const TncView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Terms and conditions"),
      body: SingleChildScrollView(child: Obx(() {
        return controller.description.value.text.make().marginAll(10);
      })),
    );
  }
}

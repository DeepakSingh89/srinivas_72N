import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/utils/app_widgets.dart';
import '../controllers/support_controller.dart';

class SupportView extends GetView<SupportController> {
  const SupportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: "Help & Support"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VxTextField(
                hint: "Name",
                controller: controller.name,
              ),
              20.heightBox,
              VxTextField(
                hint: "Email",
                controller: controller.email,
              ),
              20.heightBox,
              VxTextField(
                hint: "Contact no",
                controller: controller.contactno,
              ),
              20.heightBox,
              VxTextField(
                hint: "Query",
                controller: controller.query,
              ),
              50.heightBox,
              ButtonPrimary(
                  title: "Submit",
                  onPressed: () {
                    controller.postHelpSupport();
                  })
            ],
          ).marginAll(10),
        ));
  }
}

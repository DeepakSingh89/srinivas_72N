import 'dart:developer';

import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/select_address_controller.dart';

class SelectAddressView extends GetView<SelectAddressController> {
  const SelectAddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: "Select Address"),
        bottomNavigationBar: ButtonPrimary(
            title: "Add Address",
            onPressed: () {
              Get.toNamed(Routes.ADD_ADDRESS)?.then((value) {
                if (value == true) {
                  controller.getAddress();
                }
              });
            }),
        body: Obx(() {
          return controller.loading.isTrue
              ? buildLoadingIndicator()
              : ListView.builder(
                  itemCount: controller.addresses.length,
                  itemBuilder: (ctx, index) {
                    return Obx(() {
                      return RadioListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              (controller.addresses[index].address?.name ??
                                      "n/a")
                                  .text
                                  .make()
                                  .expand(),
                              (controller.addresses[index].address
                                          ?.addresstype ??
                                      "n/a")
                                  .text
                                  .white
                                  .make()
                                  .pOnly(left: 10, right: 10, top: 5, bottom: 5)
                                  .box
                                  .roundedSM
                                  .color(themeColor)
                                  .make()
                            ],
                          ).marginOnly(bottom: 10),
                          subtitle: controller
                              .buildAddress(controller.addresses[index])
                              .text
                              .make()
                              .marginOnly(top: 5, bottom: 5),
                          value: controller.addresses[index].id!,
                          groupValue: controller.selectedAddressID.value,
                          onChanged: (String? value) {
                            log("on changed $value");
                            controller.selectedAddressID.value = value!;
                            final map = {
                              "name":
                                  (controller.addresses[index].address?.name ??
                                      "n/a"),
                              "id": controller.addresses[index].id,
                              "address": controller
                                  .buildAddress(controller.addresses[index])
                            };
                            Get.back(result: map);
                          });
                    });
                  });
        }));
  }
}

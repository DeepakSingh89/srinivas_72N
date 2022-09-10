import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/add_address_controller.dart';

class AddAddressView extends GetView<AddAddressController> {
  const AddAddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: "Add Address"),
        bottomNavigationBar: Obx(() => controller.loading.isTrue
            ? const ButtonLoading()
            : ButtonPrimary(
                title: "Save Address",
                onPressed: () {
                  controller.addAddress();
                })),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            VxTextField(
              hint: "Flat/House No.",
              borderType: VxTextFieldBorderType.roundLine,
              controller: controller.controllerFlatNo,
              borderRadius: 10,
            ),
            10.heightBox,
            VxTextField(
              hint: "Floor No.*",
              borderType: VxTextFieldBorderType.roundLine,
              controller: controller.controllerFloorNo,
              borderRadius: 10,
            ),
            10.heightBox,
            VxTextField(
              hint: "Town No.*",
              borderType: VxTextFieldBorderType.roundLine,
              controller: controller.controllerTownNo,
              borderRadius: 10,
            ),
            10.heightBox,
            VxTextField(
              hint: "Building/Apartment Name*",
              borderType: VxTextFieldBorderType.roundLine,
              controller: controller.controllerApartmentName,
              borderRadius: 10,
            ),
            10.heightBox,
            VxTextField(
              hint: "Address*",
              borderType: VxTextFieldBorderType.roundLine,
              controller: controller.controllerAddress,
              borderRadius: 10,
            ),
            10.heightBox,
            VxTextField(
              hint: "Landmark/Area*",
              borderType: VxTextFieldBorderType.roundLine,
              controller: controller.controllerLandmark,
              borderRadius: 10,
            ),
            20.heightBox,
            "Delivery contact Details".text.make(),
            20.heightBox,
            VxTextField(
              hint: "Name",
              borderType: VxTextFieldBorderType.roundLine,
              controller: controller.controllerName,
              borderRadius: 10,
            ),
            10.heightBox,
            VxTextField(
              hint: "Phone number",
              borderType: VxTextFieldBorderType.roundLine,
              controller: controller.controllerNumber,
              borderRadius: 10,
            ),
            10.heightBox,
            "This mobile number will receive an OTP, required for collecting the order"
                .text
                .size(12)
                .gray500
                .make(),
            20.heightBox,
            "Save as".text.make(),
            Obx(() => Row(
                  children: [
                    RadioListTile(
                        title: "Home".text.size(14).make(),
                        value: "Home",
                        groupValue: controller.selectedType.value,
                        onChanged: (String? value) {
                          controller.selectedType.value = value!;
                        }).expand(),
                    RadioListTile(
                        title: "Work".text.size(14).make(),
                        value: "Work",
                        groupValue: controller.selectedType.value,
                        onChanged: (String? value) {
                          controller.selectedType.value = value!;
                        }).expand(),
                    RadioListTile(
                        title: "Other".text.size(14).make(),
                        value: "Other",
                        groupValue: controller.selectedType.value,
                        onChanged: (String? value) {
                          controller.selectedType.value = value!;
                        }).expand()
                  ],
                ))
          ]).marginAll(10),
        ));
  }
}

import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/params/address/add_address_params/add_address_params.dart';
import 'package:direct2u/app/domain/params/address/add_address_params/address.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  final count = 0.obs;
  final loading = false.obs;

  final TextEditingController controllerFlatNo = TextEditingController();
  final TextEditingController controllerFloorNo = TextEditingController();
  final TextEditingController controllerTownNo = TextEditingController();
  final TextEditingController controllerApartmentName = TextEditingController();
  final TextEditingController controllerAddress = TextEditingController();
  final TextEditingController controllerLandmark = TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerNumber = TextEditingController();

  final selectedType = "Home".obs;

  addAddress() async {
    try {
      if (controllerFlatNo.text.isBlank == true ||
          controllerFloorNo.text.isBlank == true ||
          controllerTownNo.text.isBlank == true ||
          controllerApartmentName.text.isBlank == true ||
          controllerAddress.text.isBlank == true ||
          controllerLandmark.text.isBlank == true ||
          controllerName.text.isBlank == true ||
          controllerNumber.text.isBlank == true) {
        showToastMessage(title: "Error", message: "Fields required");
        return;
      }

      loading.value = true;
      final addAddressParams = AddAddressParams(
          address: Address(
              flatHousenumber: controllerFlatNo.text,
              floorNumber: controllerFloorNo.text,
              towerNumber: controllerTownNo.text,
              buildingApartmentname: controllerApartmentName.text,
              address: controllerAddress.text,
              landmarkArea: controllerLandmark.text,
              name: controllerName.text,
              phone: controllerNumber.text,
              addresstype: selectedType.value));
      final response = await userRepository.addAddress(addAddressParams);
      loading.value = false;
      if (response.data != null) {
        Get.back(result: true);
        showToastMessage(
            title: "Success", message: "Address added successfully");
      }
    } catch (e) {
      log("e $e");
      loading.value = false;
    }
  }

  void increment() => count.value++;
}

import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/domain/entities/address/get_address_response/get_address_response.dart';
import 'package:get/get.dart';

class SelectAddressController extends GetxController {
  final addresses = <GetAddressResponse>[].obs;
  final loading = false.obs;
  final selectedAddressID = "".obs;

  @override
  void onInit() {
    super.onInit();
    selectedAddressID.value = Get.arguments ?? "";
    getAddress();
  }

  getAddress() async {
    try {
      loading.value = true;
      addresses.value = (await userRepository.getAddress()).data ?? [];
      log("length ${addresses.length}");
      loading.value = false;
    } catch (e) {
      log("e $e");
      loading.value = false;
    }
  }

  String buildAddress(GetAddressResponse address) {
    return "${address.address?.flatHousenumber ?? "n/a"} ${address.address?.floorNumber ?? "n/a"} ${address.address?.towerNumber ?? "n/a"} ${address.address?.buildingApartmentname ?? "n/a"} ${address.address?.address ?? "n/a"} ${address.address?.landmarkArea ?? "n/a"} ${address.address?.phone ?? "n/a"}";
  }
}

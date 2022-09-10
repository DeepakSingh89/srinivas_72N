import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/domain/entities/coupons/get_all_coupons/coupon.dart';
import 'package:get/get.dart';

class ViewAllCouponsController extends GetxController {
  final loading = false.obs;
  final coupons = <Coupon>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllCoupons();
  }

  getAllCoupons() async {
    loading.value = true;
    try {
      coupons.value =
          (await cartRepository.getAllCoupons()).data?.coupons ?? [];
      loading.value = false;
    } catch (e) {
      log("e $e");
      loading.value = false;
    }
  }

  applyCoupon(Coupon coupon) async {
    try {
      Get.back(result: coupon);
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }
}

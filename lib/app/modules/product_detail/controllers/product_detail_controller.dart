import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:get/get.dart';

import '../../../domain/entities/products/get_products_response/product.dart';

class ProductDetailController extends GetxController {
  final count = 0.obs;
  late final Product product;
  final wishlistLoading = false.obs;
  final addToCartLoading = false.obs;
  final buyNowLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments;
  }

  addToWishlist() async {
    try {
      wishlistLoading.value = true;
      final response =
          (await productRepository.addToWishlist(product.id!)).data;
      wishlistLoading.value = false;
      if (response != null) {
        product.iswishlisted?.value = true;
        showToastMessage(
            title: "Success", message: "Product added successfully");
      }
    } catch (e) {
      log("e $e");
      wishlistLoading.value = false;
    }
  }

  void increment() => count.value++;
}

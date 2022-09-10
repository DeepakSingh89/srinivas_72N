import 'dart:developer';
import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/domain/entities/products/get_products_response/product.dart';
import 'package:get/get.dart';

class ViewAllProductsController extends GetxController {
  late final String id;
  late final products = <Product>[].obs;
  final productLoading = false.obs;
  bool isFeatured = false;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments["id"];
    isFeatured = Get.arguments["isFeatured"];
    getProducts();
  }

  getProducts() async {
    productLoading.value = true;
    try {
      if (isFeatured) {
        products.value = (await productRepository.getHomeFeaturedProducts(id))
                .data
                ?.products ??
            [];
      } else {
        products.value = (await productRepository.getProductsByCategory(id))
                .data
                ?.products ??
            [];
      }

      log("length $products");
      productLoading.value = false;
    } catch (e) {
      log("e $e");
      productLoading.value = false;
    }
  }
}

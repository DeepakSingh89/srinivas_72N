import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/domain/entities/cart/get_cart_response/product.dart';
import 'package:direct2u/app/domain/entities/orders/get_order_response/order.dart';
import 'package:direct2u/app/domain/entities/products/get_products_response/product.dart';
import 'package:direct2u/app/domain/params/cart/review_product_params.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/constants/app_constants.dart';

class OrderDetailController extends GetxController {
  final count = 0.obs;
  late Order order;

  @override
  void onInit() {
    super.onInit();
    order = Get.arguments;
  }

  void increment() => count.value++;

  void rateProduct(RatingDialogResponse dialog, CartProduct cartProduct) async {
    try {
      buildDialogLoadingIndicator();
      ReviewProductParams params = ReviewProductParams(
          product: cartProduct.product?.id,
          review: dialog.comment,
          starRating: dialog.rating.toInt());
      final response = (await productRepository.reviewProduct(params));
      Get.back();
      if (response.data != null) {
        showToastMessage(title: "Success", message: "Thanks for your feedback");
      }
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }

  createDynamicLink(Product product) async {
    buildDialogLoadingIndicator();
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("$serverBaseUrl?product=${product.id}"),
      uriPrefix: dynamicPageLink,
      androidParameters: const AndroidParameters(packageName: "com.direct2u"),
      iosParameters: const IOSParameters(bundleId: "com.direct2u"),
    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
    Get.back();
    Share.share(
        "Checkout this product ${product.title} ${dynamicLink.shortUrl}");
    log("link ${dynamicLink.shortUrl}");
  }
}

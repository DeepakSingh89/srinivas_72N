import 'dart:developer';

import 'package:direct2u/app/core/constants/app_constants.dart';
import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/entities/cart/get_cart_response/get_cart_response.dart';
import 'package:direct2u/app/domain/params/cart/checkout_params.dart';
import 'package:direct2u/app/domain/params/cart/update_cart_params.dart';
import 'package:direct2u/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../core/utils/app_widgets.dart';
import '../../../domain/entities/cart/get_cart_response/product.dart';
import '../../../domain/entities/coupons/get_all_coupons/coupon.dart';

class CartController extends GetxController {
  GetCartResponse? response;
  final loading = false.obs;
  late final products = <CartProduct>[].obs;

  final addressID = "".obs;
  final address = "".obs;
  final addressName = "".obs;
  final TextEditingController couponController = TextEditingController();

  final payableAmount = 0.0.obs;
  final couponDiscount = 0.0.obs;
  final couponMinOrder = 0.0.obs;
  final subTotal = 0.0.obs;
  final shippingCharge = 0.0.obs;
  String? couponCode;
  final razorpay = Razorpay();

  void init() {
    super.onInit();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    getCart();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Get.back();
    showToastMessage(title: "Success", message: "Payment Successfull");
    orderController.getOrders();
    products.clear();
    Get.offAllNamed(Routes.MAIN);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.back();
    showToastMessage(title: "Error", message: "Payment Failed");
  }

  placeOrder() async {
    try {
      if (addressID.isEmpty) {
        showToastMessage(title: "Error", message: "Address is required");
        return;
      }
      final params =
          CheckoutParams(address: addressID.value, coupon: couponCode);
      log("pata ${params.toJson()}");
      buildDialogLoadingIndicator();
      final response = (await cartRepository.checkout(params)).data;
      if (response != null) {
        final placeOrdeResponse = (await cartRepository.placeOrder()).data;
        log("order  id ${placeOrdeResponse?.orderId}");
        if (placeOrdeResponse != null && placeOrdeResponse.orderId != null) {
          var options = {
            'key': razorpayApiKey,
            'name': 'Direct2U',
            'description': 'Order',
            'order_id': placeOrdeResponse.orderId
          };
          razorpay.open(options);
        } else {
          Get.back();
        }
      } else {
        Get.back();
      }
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }

  getCart() async {
    try {
      loading.value = true;
      response = (await cartRepository.getCart()).data;
      loading.value = false;
      setPaymentDetails();
    } catch (e) {
      log("e $e");
      loading.value = false;
    }
  }

  void setPaymentDetails() {
    if (response?.cart != null) {
      products.value = (response?.cart?.products)!;
      subTotal.value = response?.cart?.subTotal?.toDouble() ?? 0.0;
      shippingCharge.value = response?.cart?.shipping?.toDouble() ?? 0.0;
      if (couponCode?.isNotEmpty == true && couponMinOrder > subTotal.value) {
        removeCoupon();
      }
      updatePayableAmount();
      log("pay ${response?.cart?.subTotal?.toDouble()}");
    }
  }

  updateCart(int quantity, String id) async {
    buildDialogLoadingIndicator();
    try {
      UpdateCartParams params =
          UpdateCartParams(product: id, quantity: quantity);
      response = (await cartRepository.updateCart(params)).data;
      Get.back();
      setPaymentDetails();
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }

  removeCoupon() {
    cartController.couponController.text = "";
    cartController.couponDiscount.value = 0.0;
    cartController.couponCode = "";
  }

  applyCoupon(Coupon coupon) {
    final discountGiven = (coupon.discount! / 100) * subTotal.value;
    couponController.text = "${coupon.couponCode} applied successfully";
    couponDiscount.value = discountGiven;
    couponCode = coupon.couponCode.toString();
    couponMinOrder.value = coupon.minOrder?.toDouble() ?? 0.0;
    updatePayableAmount();
  }

  updatePayableAmount() {
    payableAmount.value =
        subTotal.value + shippingCharge.value - couponDiscount.value;
  }
}

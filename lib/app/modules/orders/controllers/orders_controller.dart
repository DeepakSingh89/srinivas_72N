import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:get/get.dart';
import '../../../domain/entities/orders/get_order_response/order.dart';

class OrdersController extends GetxController {
  final count = 0.obs;
  final orders = <Order>[].obs;
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  getOrders() async {
    try {
      log("orders");
      loading.value = true;
      orders.value = (await orderRepository.getOrders()).data?.orders ?? [];
      log("orders ${orders.length}");
      loading.value = false;
    } catch (e) {
      loading.value = false;
      log("e $e");
    }
  }

  void increment() => count.value++;
}

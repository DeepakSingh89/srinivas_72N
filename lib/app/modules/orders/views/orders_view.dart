import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/domain/entities/orders/get_order_response/order.dart';
import 'package:direct2u/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return orderController.loading.isTrue
          ? buildLoadingIndicator()
          : orderController.orders.isEmpty
              ? "No Orders found".text.make().centered()
              : ListView.separated(
                  itemCount: orderController.orders.length,
                  separatorBuilder: (ctx, index) {
                    return const VxDivider();
                  },
                  itemBuilder: ((context, index) {
                    return BuildOrderITem(orderController.orders[index]);
                  }));
    }));
  }
}

class BuildOrderITem extends StatelessWidget {
  BuildOrderITem(
    this.order, {
    Key? key,
  }) : super(key: key) {
    order.products?.forEach((element) {
      log("element ${element.toJson()}");
      name.value = name.isEmpty
          ? "${element.product?.title}"
          : "$name ${element.product?.title}";
    });
  }
  final Order order;
  final name = "".obs;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed(Routes.ORDER_DETAIL, arguments: order);
      },
      leading: BuildNetworkImage(
          image:
              order.products?.first.product?.productPictures?.isNotEmpty == true
                  ? order.products?.first.product?.productPictures?.first.img
                  : null,
          height: 100,
          width: 100),
      title: ("$name").text.start.make(),
      subtitle: (order.delivered == true ? "Delivered" : "Not yet delivered")
          .text
          .make(),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}

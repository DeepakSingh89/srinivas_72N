import 'dart:developer';

import 'package:direct2u/app/core/resources/app_resources.dart';
import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/domain/entities/coupons/get_all_coupons/coupon.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/utils/app_repositories.dart';
import '../controllers/view_all_coupons_controller.dart';

class ViewAllCouponsView extends GetView<ViewAllCouponsController> {
  const ViewAllCouponsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Coupons"),
      body: Obx(() => controller.loading.isTrue
          ? buildLoadingIndicator()
          : ListView.separated(
              itemCount: controller.coupons.length,
              separatorBuilder: (ctx, index) {
                return const VxDivider().marginOnly(top: 10, bottom: 10);
              },
              itemBuilder: (context, index) {
                return buildCouponItem(controller.coupons[index]);
              })),
    );
  }

  buildCouponItem(Coupon coupon) {
    log("subtotal ${cartController.subTotal}");
    return ListTile(
        enabled: isEnable(coupon),
        leading: Column(
          children: const [
            Spacer(),
            Icon(Icons.discount_rounded),
            Spacer(),
          ],
        ),
        title: coupon.couponCode?.text.make().box.roundedSM.make(),
        subtitle:
            "FLAT ${coupon.discount}% OFF \nOn minimum order of Rs.${coupon.minOrder}"
                .text
                .make(),
        trailing: Visibility(
            visible: isEnable(coupon),
            child: "Apply"
                .text
                .white
                .make()
                .paddingOnly(left: 10, right: 10, top: 5, bottom: 5)
                .box
                .color(themeColor)
                .roundedSM
                .make()
                .onInkTap(() {
              controller.applyCoupon(coupon);
            })));
  }

  bool isEnable(Coupon coupon) =>
      cartController.subTotal >= (coupon.minOrder?.toDouble() ?? 0.0);
}

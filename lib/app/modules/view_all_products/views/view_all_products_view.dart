import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/view_all_products_controller.dart';

class ViewAllProductsView extends GetView<ViewAllProductsController> {
  const ViewAllProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: "All Products"),
        body: Obx(() => controller.productLoading.isTrue
            ? buildLoadingIndicator()
            : ListView.separated(
                itemCount: controller.products.length,
                separatorBuilder: (ctx, index) {
                  return const VxDivider();
                },
                itemBuilder: ((context, index) {
                  return BuildProductListView(
                    product: controller.products[index],
                  );
                }))));
  }
}

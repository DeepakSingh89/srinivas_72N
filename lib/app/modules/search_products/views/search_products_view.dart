import 'package:direct2u/app/core/resources/app_resources.dart';
import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/search_products_controller.dart';

class SearchProductsView extends GetView<SearchProductsController> {
  const SearchProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: "Search Products".text.make(),
          elevation: 0,
        ),
        body: Column(
          children: [
            BuildSearchWidget(
                textEditingController: controller.textController,
                micSearch: () {
                  controller.voiceSearch();
                },
                onChanged: ((value) {
                  controller.streamController.add(value);
                })).box.color(themeColor).make(),
            Obx(() {
              return controller.loading.isTrue
                  ? buildLoadingIndicator().expand()
                  : controller.products.isEmpty == true
                      ? "No products found".text.make().centered().expand()
                      : GridView.builder(
                          itemCount: controller.products.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisExtent: productHeight),
                          itemBuilder: (context, index) {
                            return BuildProduct(
                                product: controller.products[index]);
                          }).expand();
            })
          ],
        ));
  }
}

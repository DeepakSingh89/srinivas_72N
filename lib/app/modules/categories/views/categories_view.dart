import 'package:direct2u/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../../../core/utils/app_widgets.dart';
import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Obx((() {
            return controller.topBannerLoading.isTrue
                ? buildLoadingIndicator()
                : controller.topBanner.isNotEmpty
                    ? BuildBanner(
                        banners: controller.topBanner,
                      )
                    : "".text.make();
          })),
          10.heightBox,
          Obx(() {
            return controller.categoriesLoading.isTrue
                ? buildLoadingIndicator()
                : GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.categories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            mainAxisExtent: 160,
                            crossAxisCount: 3),
                    itemBuilder: (ctx, index) {
                      return BuildCategory(
                          name: controller.categories[index].category!,
                          id: controller.categories[index].id!,
                          image: controller.categories[index].categoryimg!);
                    }).marginOnly(left: 10, right: 10);
          }),
          20.heightBox,
        ],
      ),
    ));
  }
}

class BuildCategory extends StatelessWidget {
  const BuildCategory(
      {Key? key, required this.name, required this.image, required this.id})
      : super(key: key);
  final String image;
  final String name;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: BuildNetworkImage(image: image, width: 120, height: 100),
        ),
        const Spacer(),
        name.text.bold.white
            .size(12)
            .maxLines(1)
            .make()
            .centered()
            .box
            .width(double.infinity)
            .customRounded(const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)))
            .height(26)
            .color(themeColor)
            .make()
      ],
    )
        .box
        .width(120)
        .margin(const EdgeInsets.all(5))
        .shadowMd
        .white
        .rounded
        .make()
        .onInkTap(() {
      Get.toNamed(Routes.VIEW_ALL_PRODUCTS,
          arguments: {"id": id, "isFeatured": false});
    });
  }
}

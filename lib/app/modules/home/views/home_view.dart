import 'package:direct2u/app/core/resources/app_resources.dart';
import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../gen/assets.gen.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          BuildCategories(),
          Obx((() {
            return controller.topBannerLoading.isTrue
                ? buildLoadingIndicator()
                : controller.topBanner.isNotEmpty
                    ? BuildBanner(
                        banners: controller.topBanner,
                      )
                    : "".text.make();
          })),
          const BuildHighlight(),
          BuildTopDeals(),
          Obx((() {
            return controller.midlleBannerLoading.isTrue
                ? buildLoadingIndicator()
                : controller.middleBanner.isNotEmpty
                    ? BuildBanner(
                        banners: controller.middleBanner,
                      )
                    : "".text.make();
          })),
          BuildRecommention(),
          20.heightBox,
          Obx((() {
            return controller.bottomBannerLoading.isTrue
                ? buildLoadingIndicator()
                : controller.bottomBanner.isNotEmpty
                    ? BuildBanner(
                        banners: controller.bottomBanner,
                      )
                    : "".text.make();
          })),
          20.heightBox,
        ],
      ),
    ));
  }
}

class BuildCategories extends StatelessWidget {
  BuildCategories({Key? key}) : super(key: key);
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx((() {
      return controller.categoriesLoading.isTrue
          ? buildLoadingIndicator()
          : ListView.builder(
              itemCount: controller.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: BuildNetworkImage(
                          image: controller.categories[index].categoryimg!,
                          width: 60,
                          height: 60),
                    ),
                    5.heightBox,
                    (controller.categories[index].category ?? "")
                        .text
                        .maxLines(1)
                        .overflow(TextOverflow.ellipsis)
                        .make()
                  ],
                ).h(100).marginAll(5).onInkTap(() {
                  Get.toNamed(Routes.VIEW_ALL_PRODUCTS, arguments: {
                    "id": controller.categories[index].id,
                    "isFeatured": false
                  });
                });
              }),
            ).h(100).marginAll(10);
    }));
  }
}

class BuildHighlight extends StatelessWidget {
  const BuildHighlight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(Assets.images.exchange.path, width: 100, height: 100),
        Image.asset(Assets.images.tax.path, width: 100, height: 100),
        Image.asset(Assets.images.fastDelivery.path, width: 100, height: 100),
      ],
    );
  }
}

class BuildTopDeals extends StatelessWidget {
  BuildTopDeals({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.homeFeaturedProductsTypeLoading.isTrue ||
              controller.firstFeaturedProductLoading.isTrue
          ? buildLoadingIndicator()
          : controller.firstFeaturedProducts.isNotEmpty
              ? Column(
                  children: [
                    ListTile(
                      title: controller.firstFeaturedProductName.value.text
                          .size(15)
                          .make(),
                      trailing: "View all".text.size(15).make().onInkTap(() {
                        Get.toNamed(Routes.VIEW_ALL_PRODUCTS, arguments: {
                          "id": controller.homeFeaturedProductsType.first.id!,
                          "isFeatured": true
                        });
                      }),
                    ),
                    ListView.builder(
                        itemCount: controller.firstFeaturedProducts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return BuildProduct(
                            product: controller.firstFeaturedProducts[index],
                          );
                        })).h(productHeight)
                  ],
                )
              : Container();
    });
  }
}

class BuildRecommention extends StatelessWidget {
  BuildRecommention({Key? key}) : super(key: key);
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.homeFeaturedProductsTypeLoading.isTrue ||
              controller.secondFeaturedProductLoading.isTrue
          ? buildLoadingIndicator()
          : controller.secondFeaturedProducts.isNotEmpty
              ? Column(
                  children: [
                    ListTile(
                      title: controller.secondFeaturedProductName.value.text
                          .size(15)
                          .make(),
                      trailing: "View all".text.size(15).make().onInkTap(() {
                        Get.toNamed(Routes.VIEW_ALL_PRODUCTS, arguments: {
                          "id": controller.homeFeaturedProductsType[1].id!,
                          "isFeatured": true
                        });
                      }),
                    ),
                    ListView.builder(
                        itemCount: controller.secondFeaturedProducts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return BuildProduct(
                            product: controller.secondFeaturedProducts[index],
                          );
                        })).h(productHeight)
                  ],
                )
              : "".text.make();
    });
  }
}

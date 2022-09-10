import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(
          children: [
            Obx(() {
              return controller.addToCartLoading.isTrue
                  ? const ButtonLoading().expand()
                  : ButtonSecondary(
                      title: "Add to cart",
                      onPressed: () {
                        AppUtils.addToCart(controller.product.id!,
                            controller.addToCartLoading);
                      }).expand();
            }),
            Obx(() {
              return controller.buyNowLoading.isTrue
                  ? const ButtonLoading().expand()
                  : ButtonPrimary(
                      title: "Buy Now",
                      onPressed: () {
                        AppUtils.addToCart(
                            controller.product.id!, controller.buyNowLoading);
                      }).expand();
            }),
          ],
        ).pOnly(top: 10, bottom: 10).box.white.shadowSm.make(),
        appBar: buildAppBar(title: "Product detail"),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            (controller.product.title ?? "n/a").text.bold.make(),
            5.heightBox,
            (controller.product.brand ?? "n/a").text.gray600.make(),
            5.heightBox,
            (controller.product.attributes?.join(", ") ?? "n/a")
                .text
                .gray600
                .make(),
            10.heightBox,
            BuildBanner(),
            20.heightBox,
            (controller.product.mrp ?? 0) > (controller.product.mop ?? 0) ==
                    true
                ? "You Save Rs.${controller.product.mrp!.toDouble() - controller.product.mop!.toDouble()}"
                    .text
                    .semiBold
                    .size(16)
                    .green600
                    .make()
                : "".text.make(),
            10.heightBox,
            Row(
              children: [
                "Rs.${controller.product.mop ?? "n/a"}".text.size(16).make(),
                5.widthBox,
                "Rs.${controller.product.mrp ?? "n/a"}"
                    .text
                    .gray400
                    .lineThrough
                    .make(),
                5.widthBox,
                "(Incl. of all taxes)".text.gray400.make()
              ],
            ),
            20.heightBox,
            buildTitle("Delivery"),
            10.heightBox,
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter pincode",
                  prefixIcon: const Icon(Icons.location_pin),
                  suffixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "Check".text.red600.bold.make(),
                    ],
                  )),
            ),
            5.heightBox,
            "Check for estimated delivery date".text.gray400.make(),
            10.heightBox,
            buildTitle("Description"),
            10.heightBox,
            (controller.product.description ?? "n/a").text.gray400.make(),
            20.heightBox,
            buildTitle("Featured & Details"),
            (controller.product.featuredDetails ?? "n/a").text.gray400.make(),
            20.heightBox,
            buildTitle("Product Information"),
            (controller.product.productInformation ?? "n/a")
                .text
                .gray400
                .make(),
            20.heightBox,
            buildTitle("Return Policy"),
            10.heightBox,
            (controller.product.returnPolicy ?? "n/a").text.gray400.make(),
          ]).marginAll(10),
        ));
  }

  Widget buildTitle(String title) => title.text.bold.size(16).make();
}

class BuildBanner extends StatelessWidget {
  BuildBanner({Key? key}) : super(key: key);
  final ProductDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageSlideshow(
          width: double.infinity,
          height: 300,
          initialPage: 0,
          indicatorColor: Colors.blue,
          indicatorBackgroundColor: Colors.grey,
          onPageChanged: (value) {},
          autoPlayInterval: 3000,
          isLoop: true,
          children: List.generate(
              controller.product.productPictures?.length ?? 0, (index) {
            return BuildNetworkImage(
              image: controller.product.productPictures?[index].img,
              width: double.infinity,
              height: 160,
            );
          }),
        ),
        Obx(() {
          return (controller.wishlistLoading.isTrue
                  ? buildLoadingIndicator()
                  : const Icon(Icons.favorite_border_rounded))
              .onInkTap(() {
            controller.addToWishlist();
          }).positioned(right: 10, top: 10);
        })
      ],
    );
  }
}

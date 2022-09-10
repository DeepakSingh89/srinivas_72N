import 'package:direct2u/app/core/constants/app_constants.dart';
import 'package:direct2u/app/core/resources/app_resources.dart';
import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/modules/main/controllers/main_controller.dart';
import 'package:direct2u/app/routes/app_pages.dart';
import 'package:direct2u/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../domain/entities/banners/banners_response/result.dart';
import '../../domain/entities/products/get_products_response/product.dart';
import 'app_utils.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: () {
              onPressed();
            },
            child: title.text.make())
        .w(double.infinity)
        .marginOnly(left: 20, right: 20);
  }
}

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: () {}, child: const CupertinoActivityIndicator())
        .w(double.infinity)
        .marginOnly(left: 20, right: 20);
  }
}

class ButtonSecondary extends StatelessWidget {
  const ButtonSecondary(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: () {
              onPressed();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: themeColor)))),
            child: title.text.color(themeColor).make())
        .w(double.infinity)
        .marginOnly(left: 20, right: 20);
  }
}

buildAppBar({String title = ""}) {
  return AppBar(
    centerTitle: false,
    backgroundColor: Vx.white,
    elevation: 0,
    title: title.text.black.make(),
    leading: const Icon(
      Icons.arrow_back_ios,
      color: Vx.gray800,
    ).onInkTap(() {
      Get.back();
    }),
  );
}

class BuildNetworkImage extends StatelessWidget {
  const BuildNetworkImage(
      {Key? key,
      required this.image,
      required this.height,
      required this.width})
      : super(key: key);
  final String? image;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? Image.network(
            image!,
            width: width,
            height: height,
            fit: BoxFit.cover,
            loadingBuilder: (ctx, widget, perc) {
              if (perc?.cumulativeBytesLoaded == perc?.expectedTotalBytes) {
                return widget;
              } else {
                return buildLoadingIndicator();
              }
            },
            errorBuilder: (err, obj, trace) {
              return buildDefaultImage();
            },
          )
        : buildDefaultImage();
  }

  Image buildDefaultImage() {
    return Image.asset(
      Assets.images.defaultImage.path,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}

class BuildBanner extends StatelessWidget {
  const BuildBanner({Key? key, required this.banners}) : super(key: key);
  final List<Result> banners;

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
        width: double.infinity,
        height: 160,
        initialPage: 0,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        onPageChanged: (value) {},
        autoPlayInterval: 3000,
        isLoop: true,
        children: List.generate(banners.length, (index) {
          return BuildNetworkImage(
            image: banners[index].bannerimg!,
            width: double.infinity,
            height: 160,
          );
        }));
  }
}

Widget buildLoadingIndicator() {
  return const CupertinoActivityIndicator().centered().marginAll(10);
}

void buildDialogLoadingIndicator() {
  Future.delayed(Duration.zero, () {
    Get.dialog(
      buildLoadingIndicator(),
    );
  });
}

buildMainAppBar(Function openDrawer) {
  final MainController controller = Get.find();
  return AppBar(
      centerTitle: true,
      leading: null,
      automaticallyImplyLeading: false,
      actions: [
        Obx(() {
          return (cartController.products.isNotEmpty == true
                  ? VxBadge(
                      color: Vx.red500,
                      size: 14,
                      limit: true,
                      count: cartController.products.length,
                      child: const Icon(Icons.shopping_cart, size: 28))
                  : const Icon(Icons.shopping_cart, size: 28))
              .marginOnly(top: 10, right: 10)
              .onInkTap(() {
            Get.toNamed(Routes.CART);
          });
        })
      ],
      title: Image.asset(
        Assets.images.logo2.path,
        height: 50,
      ).paddingOnly(left: 10, right: 10),
      bottom: BuildSearchWidget(
        textEditingController: TextEditingController(),
        micSearch: () {
          controller.voiceSearch();
        },
        onChanged: ((value) {
          controller.streamController.add(value);
        }),
      ));
}

class BuildSearchWidget extends StatelessWidget implements PreferredSizeWidget {
  const BuildSearchWidget(
      {Key? key,
      required this.onChanged,
      required this.textEditingController,
      required this.micSearch})
      : super(key: key);

  final Function(String value) onChanged;
  final Function micSearch;

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextField(
          controller: textEditingController,
          onChanged: (val) {
            onChanged(val);
          },
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search product by name",
              hintStyle: const TextStyle(fontSize: 15, color: Vx.gray500),
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              prefixIcon: Image.asset(Assets.images.search.path)
                  .marginOnly(left: 10, right: 15),
              suffixIcon: Image.asset(Assets.images.qrscan.path)),
        )
            .box
            .height(45)
            .roundedSM
            .shadowSm
            .white
            .margin(const EdgeInsets.all(10))
            .make()
            .expand(),
        10.widthBox,
        const Icon(Icons.mic_rounded, color: Vx.white, size: 32).onInkTap(() {
          micSearch();
        }),
        10.widthBox
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class BuildProduct extends StatelessWidget {
  BuildProduct({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  final addToCartLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: BuildNetworkImage(
              image: product.productPictures?.isNotEmpty == true
                  ? (bucketBaseUrl + (product.productPictures?.first.img)!)
                  : null,
              height: 100,
              width: double.infinity),
        ),
        5.heightBox,
        (product.title ?? "n/a")
            .text
            .size(12)
            .maxLines(1)
            .make()
            .paddingOnly(left: 5),
        5.heightBox,
        "Rs.${product.mop ?? "n/a"}"
            .text
            .size(12)
            .bold
            .make()
            .paddingOnly(left: 5),
        const Spacer(),
        Obx(() {
          return (addToCartLoading.isTrue
                  ? buildLoadingIndicator()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.shopping_cart,
                            color: Vx.white, size: 16),
                        5.widthBox,
                        "Add to cart"
                            .text
                            .bold
                            .white
                            .size(12)
                            .maxLines(1)
                            .make()
                      ],
                    ))
              .box
              .width(double.infinity)
              .customRounded(const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)))
              .height(32)
              .color(themeColor)
              .make()
              .onInkTap(() {
            if (addToCartLoading.isFalse) {
              AppUtils.addToCart(product.id!, addToCartLoading);
            }
          });
        })
      ],
    ).box.width(140).shadowMd.white.rounded.make().marginAll(10).onInkTap(() {
      Get.toNamed(Routes.PRODUCT_DETAIL, arguments: product);
    });
  }
}

class BuildProductListView extends StatelessWidget {
  BuildProductListView({Key? key, required this.product}) : super(key: key);
  final Product product;

  final addToCartLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Row(
        children: [
          BuildNetworkImage(
              image: product.productPictures?.isNotEmpty == true
                  ? (bucketBaseUrl + (product.productPictures?.first.img)!)
                  : null,
              height: 100,
              width: 100),
          10.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (product.title ?? "n/a").text.semiBold.size(12).make(),
              5.heightBox,
              (product.brand ?? "n/a").text.size(12).make(),
              5.heightBox,
              (product.attributes?.join(", ") ?? "n/a")
                  .text
                  .size(12)
                  .semiBold
                  .make(),
              5.heightBox,
              Row(
                children: [
                  "Rs.${product.mop ?? "n/a"}".text.size(14).bold.make(),
                  5.widthBox,
                  "Rs.${product.mrp ?? "n/a"}"
                      .text
                      .size(10)
                      .gray400
                      .lineThrough
                      .make(),
                  5.widthBox,
                ],
              ),
              5.heightBox,
              (product.mrp ?? 0) > (product.mop ?? 0) == true
                  ? "You Save Rs.${product.mrp!.toDouble() - product.mop!.toDouble()}"
                      .text
                      .green700
                      .size(12)
                      .make()
                  : "".text.make(),
              20.heightBox,
            ],
          ),
        ],
      ),
      Obx(() {
        return (addToCartLoading.isTrue
                ? buildLoadingIndicator().h(32).w(32)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      10.widthBox,
                      const Icon(Icons.shopping_cart,
                          color: Vx.white, size: 16),
                      5.widthBox,
                      "Add to cart".text.bold.white.size(12).maxLines(1).make(),
                      10.widthBox
                    ],
                  ))
            .box
            .roundedSM
            .height(32)
            .color(themeColor)
            .make()
            .onInkTap(() {
          if (addToCartLoading.isFalse) {
            AppUtils.addToCart(product.id!, addToCartLoading);
          }
        });
      })
    ]).marginAll(10).onInkTap(() {
      Get.toNamed(Routes.PRODUCT_DETAIL, arguments: product);
    });
  }
}

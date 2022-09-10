import 'dart:developer';

import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/domain/entities/cart/get_cart_response/product.dart';
import 'package:direct2u/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/constants/app_constants.dart';
import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  const OrderDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: "Order Detail"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                  itemCount: controller.order.products?.length ?? 0,
                  separatorBuilder: (ctx, index) {
                    return buildDivider();
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return BuildCartItem(controller.order.products![index]);
                  }),
              10.heightBox,
              buildDivider2(),
              15.heightBox,
              // buildTitle("How's your item?"),
              // 10.heightBox,
              // buildDivider(),
              // ListTile(
              //   title: "Write a product review".text.size(12).make(),
              //   onTap: () {},
              //   trailing: const Icon(Icons.arrow_forward_ios, color: Vx.black),
              // ),
              // buildDivider(),
              // ListTile(
              //   title: "Create a video review".text.size(12).make(),
              //   trailing: const Icon(Icons.arrow_forward_ios, color: Vx.black),
              // ),
              // buildDivider2(),
              // 15.heightBox,
              buildTitle("Order Info"),
              10.heightBox,

              BuildPaymentDetails(),

              10.heightBox,
              "Return window closed on 16th May'22"
                  .text
                  .size(12)
                  .make()
                  .marginOnly(left: 10),
              20.heightBox,
              Row(
                children: [
                  "Download Invoice".text.make().expand(),
                  const Icon(Icons.arrow_forward_ios, color: Vx.black),
                ],
              ).marginAll(10)

              // buildDivider2(),
              // 10.heightBox,
              // const BuildTopDeals(),
              // 10.heightBox,
            ],
          ),
        ));
  }

  Widget buildTitle(String title) {
    return title.text.semiBold.size(15).make().marginOnly(left: 10);
  }

  VxDivider buildDivider2() {
    return const VxDivider(
      width: 8,
    );
  }

  VxDivider buildDivider() {
    return const VxDivider(
      width: 0.1,
      color: Vx.black,
    );
  }
}

class BuildTopDeals extends StatelessWidget {
  const BuildTopDeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: "Pick-up where you left off".text.size(15).make(),
        ),
        // ListView.builder(
        //     itemCount: 5,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: ((context, index) {
        //       return const BuildProduct();
        //     })).h(productHeight)
      ],
    );
  }
}

class BuildCartItem extends StatelessWidget {
  BuildCartItem(this.cartProduct, {Key? key}) : super(key: key);

  final CartProduct cartProduct;
  final OrderDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildNetworkImage(
            image: cartProduct.product?.productPictures?.isNotEmpty == true &&
                    cartProduct.product?.productPictures?.first.img
                            .isEmptyOrNull ==
                        false
                ? (bucketBaseUrl +
                    (cartProduct.product?.productPictures?.first.img)!)
                : null,
            height: 100,
            width: 100),
        10.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (cartProduct.product?.title ?? "n/a").text.size(12).make(),
            5.heightBox,
            (cartProduct.product?.brand ?? "n/a").text.size(12).make(),
            5.heightBox,
            (cartProduct.product?.attributes?.join(", ") ?? "n/a")
                .text
                .size(12)
                .make(),
            5.heightBox,
            Row(
              children: [
                const Icon(
                  Icons.ios_share_outlined,
                  size: 12,
                  color: Vx.gray600,
                ),
                5.widthBox,
                "Share this item".text.gray600.size(12).make().onInkTap(() {
                  controller.createDynamicLink(cartProduct.product!);
                }),
              ],
            ),
            10.heightBox,
            "Buy it again".text.make().onInkTap(() {
              Get.toNamed(Routes.PRODUCT_DETAIL,
                  arguments: cartProduct.product);
            }),
          ],
        ).expand(),
        controller.order.delivered == true
            ? "Rate".text.make().onInkTap(() {
                rateProduct(cartProduct);
              })
            : "Not delivered".text.make()
      ],
    ).marginAll(10);
  }

  void rateProduct(CartProduct cartProduct) {
    final dialog = RatingDialog(
      initialRating: 3.0,
      // your app's name?
      title: Text(
        'Rate your ${cartProduct.product?.title}',
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      // image: const FlutterLogo(size: 100),
      submitButtonText: 'Submit',
      commentHint: 'Write your comment here',
      onCancelled: () => log('cancelled'),
      onSubmitted: (response) {
        log('rating: ${response.rating}, comment: ${response.comment}');
        controller.rateProduct(response, cartProduct);
      },
    );
    showDialog(
      context: Get.context!,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => dialog,
    );
  }
}

class BuildPaymentDetails extends StatelessWidget {
  BuildPaymentDetails({Key? key}) : super(key: key);

  final OrderDetailController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildPriceItem("Sub Total", controller.order.grandTotal.toString()),
        buildPriceItem(
            "Shipping Charges", controller.order.shippingPrice.toString()),
        buildPriceItem("Discount", controller.order.discount.toString()),
        const VxDivider().marginOnly(top: 10, bottom: 10),
        buildPriceItem(
            "Amount Paid", controller.order.amountToBePaid.toString()),
      ],
    );
  }

  Widget buildPriceItem(String title, String price) {
    return Row(
      children: [title.text.make().expand(), "Rs.$price".text.make()],
    ).marginAll(10);
  }
}

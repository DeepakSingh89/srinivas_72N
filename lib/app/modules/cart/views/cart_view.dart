import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/domain/entities/cart/get_cart_response/product.dart';
import 'package:direct2u/app/routes/app_pages.dart';
import 'package:direct2u/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/resources/app_resources.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    cartController.init();
    return Scaffold(
        appBar: buildAppBar(),
        bottomNavigationBar: const BuildPlaceOrderSection(),
        body: Obx(() => cartController.loading.isTrue
            ? buildLoadingIndicator()
            : cartController.products.isEmpty == true
                ? Lottie.asset(Assets.images.emptyCart, width: 300, height: 300)
                    .centered()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTitle(),
                        20.heightBox,
                        const BuildProducts(),
                        buildDivider(),
                        buildSubTitle("Delivery address"),
                        10.heightBox,
                        buildSelectAddress(),
                        buildDivider(),
                        buildViewAllCoupon(),
                        10.heightBox,
                        buildCouponApplied(),
                        buildDivider(),
                        buildSubTitle("Payment Details"),
                        const BuildPaymentDetails()
                      ],
                    ),
                  )));
  }

  TextField buildCouponApplied() {
    return TextField(
      controller: cartController.couponController,
      enabled: false,
      style: const TextStyle(color: Vx.green600),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.discount_outlined),
        hintText: "Check all coupon codes",
      ),
    );
  }

  Widget buildViewAllCoupon() {
    return Row(
      children: [
        buildSubTitle("Apply Coupon"),
        const Spacer(),
        "View all".text.blue500.size(16).make().marginOnly().onInkTap(() {
          Get.toNamed(Routes.VIEW_ALL_COUPONS)?.then((value) {
            if (value != null) {
              cartController.applyCoupon(value);
            }
          });
        })
      ],
    ).marginOnly(right: 10);
  }

  Widget buildDivider() {
    return Column(
      children: [
        20.heightBox,
        const VxDivider(
          width: 8,
        ),
        20.heightBox,
      ],
    );
  }

  Obx buildSelectAddress() {
    return Obx(() {
      return cartController.addressID.isEmpty
          ? ButtonPrimary(
              title: "Select address",
              onPressed: () {
                selectAddress();
              })
          : ListTile(
              title: cartController.addressName.value.text.make(),
              subtitle: cartController.address.value.text.make(),
              trailing: "Change"
                  .text
                  .white
                  .make()
                  .pOnly(left: 20, right: 20, top: 5, bottom: 5)
                  .box
                  .roundedSM
                  .color(themeColor)
                  .make()
                  .onInkTap(() {
                selectAddress();
              }),
            );
    });
  }

  Widget buildSubTitle(String title) {
    return title.text.bold.size(16).make().marginOnly(left: 10);
  }

  Widget buildTitle() {
    return Row(
      children: [
        "Product Details".text.bold.size(16).make().expand(),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            "Total (${cartController.products.length} Items)"
                .text
                .size(12)
                .gray500
                .make(),
            5.heightBox,
          ],
        )
      ],
    ).marginOnly(left: 10, right: 10);
  }

  void selectAddress() {
    Get.toNamed(Routes.SELECT_ADDRESS,
            arguments: cartController.addressID.value)
        ?.then((value) {
      if (value != null) {
        cartController.addressName.value = value["name"];
        cartController.addressID.value = value["id"];
        cartController.address.value = value["address"];
      }
    });
  }
}

class BuildProducts extends StatelessWidget {
  const BuildProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
            children: List.generate(cartController.products.length, (index) {
          return BuildCartItem(product: cartController.products[index]);
        })));
  }
}

class BuildPlaceOrderSection extends StatelessWidget {
  const BuildPlaceOrderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: cartController.products.isNotEmpty,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                "Payale amount".text.gray600.make(),
                2.heightBox,
                "Rs.${cartController.payableAmount}".text.bold.make()
              ],
            ).expand(),
            ButtonPrimary(
                title: "Place Order",
                onPressed: () {
                  cartController.placeOrder();
                }).expand()
          ],
        ),
      ).marginAll(10).box.border(color: Vx.gray400).white.make();
    });
  }
}

class BuildCartItem extends StatelessWidget {
  const BuildCartItem({Key? key, required this.product}) : super(key: key);
  final CartProduct product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.widthBox,
        BuildNetworkImage(
            image: product.product?.productPictures?.isNotEmpty == true
                ? (bucketBaseUrl +
                    (product.product?.productPictures?.first.img)!)
                : null,
            height: 100,
            width: 100),
        10.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (product.product?.title ?? "n/a").text.semiBold.size(12).make(),
            5.heightBox,
            (product.product?.brand ?? "n/a").text.size(12).make(),
            5.heightBox,
            (product.product?.attributes?.join(", ") ?? "n/a")
                .text
                .size(12)
                .semiBold
                .make(),
            5.heightBox,
            Row(
              children: [
                "Rs.${product.product?.mop ?? "n/a"}".text.size(14).bold.make(),
                5.widthBox,
                "Rs.${product.product?.mrp ?? "n/a"}"
                    .text
                    .size(10)
                    .gray400
                    .lineThrough
                    .make(),
                5.widthBox,
              ],
            ),
            5.heightBox,
            (product.product?.mrp ?? 0) > (product.product?.mop ?? 0) == true
                ? "You Save Rs.${product.product!.mrp!.toDouble() - product.product!.mop!.toDouble()}"
                    .text
                    .green700
                    .size(12)
                    .make()
                : "".text.make(),
            20.heightBox,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.remove,
                  color: Vx.white,
                ).box.roundedSM.color(themeColor).make().onInkTap(() {
                  cartController.updateCart(
                      (product.quantity?.toInt() ?? 0) - 1,
                      product.product?.id ?? "");
                }),
                "${product.quantity}"
                    .text
                    .make()
                    .marginOnly(left: 10, right: 10),
                const Icon(
                  Icons.add,
                  color: Vx.white,
                ).box.roundedSM.color(themeColor).make().onInkTap(() {
                  cartController.updateCart(
                      (product.quantity?.toInt() ?? 0) + 1,
                      product.product?.id ?? "");
                })
              ],
            ),
            20.heightBox,
          ],
        ).expand(),
        "Rs.${product.total ?? "n/a"}".text.size(18).bold.make(),
        10.widthBox,
      ],
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
          title: "Top Deals".text.size(15).make(),
          trailing: "View all".text.size(15).make(),
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

class BuildPaymentDetails extends StatelessWidget {
  const BuildPaymentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            ListTile(
              title: "Sub Total".text.gray500.make(),
              trailing:
                  "Rs.${cartController.subTotal.value}".text.gray500.make(),
            ).h(20),
            10.heightBox,
            ListTile(
              title: "Shipping charges".text.gray500.make(),
              trailing: "+ Rs.${cartController.shippingCharge.value}"
                  .text
                  .gray500
                  .make(),
            ).h(20),
            10.heightBox,
            ListTile(
              title: "Discount".text.gray500.make(),
              trailing: "Rs.${cartController.couponDiscount.value}"
                  .text
                  .gray500
                  .make(),
            ).h(20),
            20.heightBox,
            ListTile(
              title: "Total Amount".text.make(),
              trailing: "Rs.${cartController.payableAmount.value}".text.make(),
            ).h(20),
            100.heightBox
          ],
        ));
  }
}

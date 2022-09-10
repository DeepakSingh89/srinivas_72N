import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: "Wishlist"),
        body: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: productHeight, crossAxisCount: 3),
            itemBuilder: (ctx, index) {
              return "".text.make();
            }));
  }
}

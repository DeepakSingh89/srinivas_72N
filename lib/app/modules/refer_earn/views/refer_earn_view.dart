import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../gen/assets.gen.dart';
import '../controllers/refer_earn_controller.dart';

class ReferEarnView extends GetView<ReferEarnController> {
  const ReferEarnView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          "Refer a Friend".text.size(22).bold.make(),
          10.heightBox,
          "And both of you can earn".text.make(),
          20.heightBox,
          Image.asset(Assets.images.refer.path),
          20.heightBox,
          "Get cashback of Rs.300".text.green700.make(),
          10.heightBox,
          "For every new user you refer".text.semiBold.make(),
          10.heightBox,
          "Share your referral link and earn Rs.300".text.make(),
          50.heightBox,
          ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            leading: const Icon(Icons.copy),
            minLeadingWidth: 10,
            title: "hrnerihoiqbf6724gyr".text.gray400.make(),
            trailing: "Share".text.green600.semiBold.make(),
          ).marginAll(10)
        ],
      )),
    );
  }
}

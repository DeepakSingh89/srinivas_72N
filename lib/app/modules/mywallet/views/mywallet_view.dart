import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/resources/app_resources.dart';
import '../controllers/mywallet_controller.dart';

class MywalletView extends GetView<MywalletController> {
  const MywalletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: "Wallet"),
        body: Column(
          children: [
            "Balance: Rs.345"
                .text
                .size(24)
                .white
                .bold
                .make()
                .centered()
                .box
                .width(double.infinity)
                .height(80)
                .roundedSM
                .color(themeColor)
                .make()
                .marginAll(10),
            10.heightBox,
            DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(20),
                  child: Column(
                    children: const [
                      TabBar(
                        tabs: [
                          Text(
                            "All",
                            style: TextStyle(color: Vx.black),
                          ),
                          Text(
                            "Expenses",
                            style: TextStyle(color: Vx.black),
                          ),
                          Text(
                            "Receives",
                            style: TextStyle(color: Vx.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    ListView(
                      children: const [BuildTrascationItem(), VxDivider()],
                    ),
                    ListView(
                      children: const [BuildTrascationItem(), VxDivider()],
                    ),
                    ListView(
                      children: const [BuildTrascationItem(), VxDivider()],
                    )
                  ],
                ),
              ),
            ).expand(),
          ],
        ));
  }
}

class BuildTrascationItem extends StatelessWidget {
  const BuildTrascationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.images.up.path),
      title: "Todays 2:30".text.size(12).gray500.make(),
      subtitle: "Name".text.black.make(),
      trailing: "Rs.345".text.red600.semiBold.make(),
    );
  }
}

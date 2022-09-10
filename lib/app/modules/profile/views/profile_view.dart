import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/data/datasources/local/app_database.dart';
import 'package:direct2u/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/resources/app_resources.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        20.heightBox,
        BuildInfo(),
        20.heightBox,
        BuildItem(
            icon: Icons.wallet,
            title: "Wallet",
            onPressed: () {
              Get.toNamed(Routes.MYWALLET);
            }),
        // BuildItem(
        //     icon: Icons.format_list_bulleted_rounded,
        //     title: "My list",
        //     onPressed: () {}),
        BuildItem(
            icon: Icons.favorite_border_outlined,
            title: "Wishlist",
            onPressed: () {
              Get.toNamed(Routes.WISHLIST);
            }),
        BuildItem(
            icon: Icons.delivery_dining_outlined,
            title: "Delivery address",
            onPressed: () {
              Get.toNamed(Routes.SELECT_ADDRESS);
            }),
        BuildItem(
            icon: Icons.support_agent_outlined,
            title: "Help & Support",
            onPressed: () {
              Get.toNamed(Routes.SUPPORT);
            }),
        BuildItem(
            icon: Icons.share,
            title: "Refer & Earn",
            onPressed: () {
              Get.toNamed(Routes.REFER_EARN);
            }),
        // BuildItem(
        //     icon: Icons.info_outline_rounded,
        //     title: "About Us",
        //     onPressed: () {}),
        BuildItem(
            icon: Icons.security_outlined,
            title: "Terms and conditions",
            onPressed: () {
              Get.toNamed(Routes.TNC);
            }),
        BuildItem(
            icon: Icons.privacy_tip_outlined,
            title: "Privacy Policy",
            onPressed: () {
              Get.toNamed(Routes.PRIVACY_POLICY);
            }),
        BuildItem(
            icon: Icons.logout_outlined,
            title: "Logout",
            onPressed: () async {
              LocalStorage.saveToken("");
              await FacebookAuth.instance.logOut();
              Get.offAllNamed(Routes.LOGIN);
            }),
        20.heightBox
      ]),
    ));
  }
}

class BuildInfo extends StatelessWidget {
  BuildInfo({Key? key}) : super(key: key);
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.loading.isTrue
          ? buildLoadingIndicator()
          : Row(
              children: [
                10.widthBox,
                ClipRRect(
                    borderRadius: BorderRadius.circular(300.0),
                    child: controller
                                .getProfileResponse.value.avatar?.isNotEmpty ==
                            true
                        ? BuildNetworkImage(
                            image: controller.getProfileResponse.value.avatar,
                            width: 60.0,
                            height: 60.0,
                          )
                        : Image.asset(
                            Assets.images.defaultImage.path,
                            fit: BoxFit.cover,
                            width: 60.0,
                            height: 60.0,
                          )),
                10.widthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (controller.getProfileResponse.value.name ?? "n/a")
                        .text
                        .bold
                        .size(16)
                        .make(),
                    (controller.getProfileResponse.value.email ?? "n/a")
                        .text
                        .gray500
                        .make(),
                    (controller.getProfileResponse.value.mobile ?? "n/a")
                        .text
                        .gray500
                        .make(),
                  ],
                ).expand(),
                10.heightBox,
                const Icon(Icons.edit_note_outlined, color: themeColor),
                10.widthBox,
              ],
            ).onInkTap(() {
              Get.toNamed(Routes.EDIT_PROFILE,
                      arguments: controller.getProfileResponse.value)
                  ?.then((value) {
                if (value != null) {
                  controller.getProfile();
                }
              });
            });
    });
  }
}

class BuildItem extends StatelessWidget {
  const BuildItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onPressed})
      : super(key: key);
  final IconData icon;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VxDivider(),
        ListTile(
          minLeadingWidth: 10,
          onTap: () {
            onPressed();
          },
          leading: Icon(
            icon,
            color: themeColor,
          ),
          title: title.text.make(),
        )
      ],
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/utils/app_widgets.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Edit profile"),
      body: SingleChildScrollView(
          child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.heightBox,
            ClipRRect(
                    borderRadius: BorderRadius.circular(300.0),
                    child: controller.profilePicUrl.isNotEmpty &&
                            controller.file.value.path.isEmpty
                        ? BuildNetworkImage(
                            image: controller.profilePicUrl.value,
                            width: 140.0,
                            height: 140.0,
                          )
                        : controller.file.value.path.isNotEmpty
                            ? Image.file(
                                controller.file.value,
                                fit: BoxFit.cover,
                                width: 140.0,
                                height: 140.0,
                              )
                            : Image.asset(
                                Assets.images.defaultImage.path,
                                fit: BoxFit.cover,
                                width: 140.0,
                                height: 140.0,
                              ))
                .onInkTap(() {
              _selectOptionBottomSheet();
            }),
            10.heightBox,
            buildProfileItem("Name", controller.nameController),
            buildProfileItem("Email", controller.emailController),
            //   buildProfileItem("Mobile no", controller.phoneController),
            10.heightBox,
            controller.loading.isTrue
                ? const ButtonLoading()
                : ButtonPrimary(
                    title: "Update Profile",
                    onPressed: () {
                      controller.updateProfile();
                    })
          ],
        ).w(double.infinity),
      )),
    );
  }

  Future<void> _selectOptionBottomSheet() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File file = File(image.path);
      controller.file.value = file;
    } else {}
  }

  buildProfileItem(String title, TextEditingController textController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        title.text.gray500.make(),
        10.heightBox,
        TextField(
          controller: textController,
        ),
      ],
    ).marginAll(10);
  }
}

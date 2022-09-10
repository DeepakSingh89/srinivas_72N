import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/domain/entities/notifications/get_notifications_response/get_notification.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.notificationsLoading.isTrue
            ? buildLoadingIndicator()
            : controller.notifications.isEmpty
                ? "No New Notifications".text.make()
                : ListView.separated(
                    itemCount: controller.notifications.length,
                    separatorBuilder: (ctx, index) {
                      return const VxDivider();
                    },
                    itemBuilder: ((context, index) {
                      return BuildNotificationItem(
                          (controller.notifications[index]));
                    }))));
  }
}

class BuildNotificationItem extends StatelessWidget {
  const BuildNotificationItem(this.notification, {Key? key}) : super(key: key);
  final GetNotification notification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: (notification.title ?? "n/a").text.make(),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (notification.notification ?? "n/a").text.make(),
          5.heightBox,
          (DateFormat("dd-MM-yyyy hh:mm:a")
                  .format(notification.createdAt!.toLocal()))
              .text
              .blue500
              .make(),
        ],
      ),
    ).marginAll(10);
  }
}

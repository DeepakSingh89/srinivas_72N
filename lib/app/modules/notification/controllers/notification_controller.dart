import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:get/get.dart';
import '../../../domain/entities/notifications/get_notifications_response/get_notification.dart';

class NotificationController extends GetxController {
  final count = 0.obs;
  final notificationsLoading = false.obs;
  final notifications = <GetNotification>[].obs;

  @override
  void onInit() {
    super.onInit();
    getNotifications();
  }

  getNotifications() async {
    notificationsLoading.value = true;
    try {
      notifications.value =
          (await userRepository.getNotifications()).data?.getNotification ?? [];
      notificationsLoading.value = false;
    } catch (e) {
      log("e $e");
      notificationsLoading.value = false;
    }
  }

  void increment() => count.value++;
}

import 'package:get/get.dart';

import '../controllers/mywallet_controller.dart';

class MywalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MywalletController>(
      () => MywalletController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/view_all_products_controller.dart';

class ViewAllProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewAllProductsController>(
      () => ViewAllProductsController(),
    );
  }
}

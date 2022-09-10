import 'package:get/get.dart';
import '../controllers/view_all_coupons_controller.dart';

class ViewAllCouponsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewAllCouponsController>(
      () => ViewAllCouponsController(),
    );
  }
}

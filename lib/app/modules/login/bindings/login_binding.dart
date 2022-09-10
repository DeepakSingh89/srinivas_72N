import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStorage>(() => GetStorage());
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}

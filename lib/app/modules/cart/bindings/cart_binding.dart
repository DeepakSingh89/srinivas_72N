import 'package:direct2u/app/data/repository/cart_repository_impl.dart';
import 'package:direct2u/app/domain/repository/icart_repository.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}

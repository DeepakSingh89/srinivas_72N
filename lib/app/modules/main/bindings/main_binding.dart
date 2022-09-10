import 'package:direct2u/app/data/repository/banner_repository_impl.dart';
import 'package:direct2u/app/data/repository/cart_repository_impl.dart';
import 'package:direct2u/app/data/repository/product_repository_impl.dart';
import 'package:direct2u/app/data/repository/user_repository_impl.dart';
import 'package:direct2u/app/domain/repository/ibanners_reposiory.dart';
import 'package:direct2u/app/domain/repository/icart_repository.dart';
import 'package:direct2u/app/domain/repository/iuser_repository.dart';
import 'package:direct2u/app/modules/cart/controllers/cart_controller.dart';
import 'package:direct2u/app/modules/home/controllers/home_controller.dart';
import 'package:direct2u/app/modules/notification/controllers/notification_controller.dart';
import 'package:direct2u/app/modules/orders/controllers/orders_controller.dart';
import 'package:direct2u/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../../../domain/repository/iproduct_repository.dart';
import '../../categories/controllers/categories_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<CategoriesController>(() => CategoriesController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<OrdersController>(() => OrdersController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<MainController>(
      () => MainController(),
    );
  }
}

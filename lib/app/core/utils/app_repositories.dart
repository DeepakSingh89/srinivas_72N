import 'package:direct2u/app/data/repository/auth_repository_impl.dart';
import 'package:direct2u/app/data/repository/banner_repository_impl.dart';
import 'package:direct2u/app/data/repository/cart_repository_impl.dart';
import 'package:direct2u/app/data/repository/cms_repository_impl.dart';
import 'package:direct2u/app/data/repository/product_repository_impl.dart';
import 'package:direct2u/app/data/repository/user_repository_impl.dart';
import 'package:direct2u/app/modules/cart/controllers/cart_controller.dart';
import 'package:direct2u/app/modules/orders/controllers/orders_controller.dart';

import '../../data/repository/order_repository_impl.dart';
import '../../domain/repository/iauth_repository.dart';
import '../../domain/repository/ibanners_reposiory.dart';
import '../../domain/repository/icart_repository.dart';
import '../../domain/repository/icms_repository.dart';
import '../../domain/repository/iorder_repository.dart';
import '../../domain/repository/iproduct_repository.dart';
import '../../domain/repository/iuser_repository.dart';

final IUserRepository userRepository = UserRepositoryImpl();
final ICartRepository cartRepository = CartRepositoryImpl();
final IProductRepository productRepository = ProductRepositoryImpl();
final IBannersRepository bannersRepository = BannerRepositoryImpl();
final IAuthRepository authRepository = AuthRepositoryImpl();
final IOrderRepository orderRepository = OrderRepositoryImpl();
final ICMSRepository cmsRepository = CMSRepositoryImpl();

final OrdersController orderController = OrdersController();
final CartController cartController = CartController();

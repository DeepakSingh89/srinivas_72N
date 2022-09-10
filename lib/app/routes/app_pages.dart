import 'package:get/get.dart';

import '../modules/add_address/bindings/add_address_binding.dart';
import '../modules/add_address/views/add_address_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/categories/bindings/categories_binding.dart';
import '../modules/categories/views/categories_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/mywallet/bindings/mywallet_binding.dart';
import '../modules/mywallet/views/mywallet_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/order_detail/bindings/order_detail_binding.dart';
import '../modules/order_detail/views/order_detail_view.dart';
import '../modules/orders/bindings/orders_binding.dart';
import '../modules/orders/views/orders_view.dart';
import '../modules/otp_verification/bindings/otp_verification_binding.dart';
import '../modules/otp_verification/views/otp_verification_view.dart';
import '../modules/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/privacy_policy/views/privacy_policy_view.dart';
import '../modules/product_detail/bindings/product_detail_binding.dart';
import '../modules/product_detail/views/product_detail_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/refer_earn/bindings/refer_earn_binding.dart';
import '../modules/refer_earn/views/refer_earn_view.dart';
import '../modules/search_products/bindings/search_products_binding.dart';
import '../modules/search_products/views/search_products_view.dart';
import '../modules/select_address/bindings/select_address_binding.dart';
import '../modules/select_address/views/select_address_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/support/bindings/support_binding.dart';
import '../modules/support/views/support_view.dart';
import '../modules/tnc/bindings/tnc_binding.dart';
import '../modules/tnc/views/tnc_view.dart';
import '../modules/view_all_coupons/bindings/view_all_coupons_binding.dart';
import '../modules/view_all_coupons/views/view_all_coupons_view.dart';
import '../modules/view_all_products/bindings/view_all_products_binding.dart';
import '../modules/view_all_products/views/view_all_products_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';
import '../modules/wishlist/bindings/wishlist_binding.dart';
import '../modules/wishlist/views/wishlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
        name: _Paths.MAIN,
        page: () => const MainView(),
        binding: MainBinding(),
        children: [
          GetPage(
            name: _Paths.HOME,
            page: () => const HomeView(),
            binding: HomeBinding(),
          ),
          GetPage(
            name: _Paths.CATEGORIES,
            page: () => const CategoriesView(),
            binding: CategoriesBinding(),
          ),
          GetPage(
            name: _Paths.ORDERS,
            page: () => const OrdersView(),
            binding: OrdersBinding(),
          ),
          GetPage(
            name: _Paths.NOTIFICATION,
            page: () => const NotificationView(),
            binding: NotificationBinding(),
          ),
          GetPage(
            name: _Paths.PROFILE,
            page: () => const ProfileView(),
            binding: ProfileBinding(),
          ),
        ]),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ADDRESS,
      page: () => const AddAddressView(),
      binding: AddAddressBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_ALL_PRODUCTS,
      page: () => const ViewAllProductsView(),
      binding: ViewAllProductsBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAIL,
      page: () => const OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => const WishlistView(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: _Paths.TNC,
      page: () => const TncView(),
      binding: TncBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.REFER_EARN,
      page: () => const ReferEarnView(),
      binding: ReferEarnBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT,
      page: () => const SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: _Paths.MYWALLET,
      page: () => const MywalletView(),
      binding: MywalletBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_ADDRESS,
      page: () => const SelectAddressView(),
      binding: SelectAddressBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_ALL_COUPONS,
      page: () => const ViewAllCouponsView(),
      binding: ViewAllCouponsBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PRODUCTS,
      page: () => const SearchProductsView(),
      binding: SearchProductsBinding(),
    ),
  ];
}

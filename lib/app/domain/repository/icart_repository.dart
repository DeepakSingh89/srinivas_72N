import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/entities/base_response.dart';
import 'package:direct2u/app/domain/entities/cart/place_order_response.dart';
import 'package:direct2u/app/domain/params/cart/checkout_params.dart';
import 'package:direct2u/app/domain/entities/cart/get_cart_response/get_cart_response.dart';
import 'package:direct2u/app/domain/entities/coupons/get_all_coupons/get_all_coupons.dart';
import 'package:direct2u/app/domain/params/cart/update_cart_params.dart';

abstract class ICartRepository {
  Future<DataState<BaseResponse>> addToCart(String id);
  Future<DataState<GetCartResponse>> getCart();
  Future<DataState<BaseResponse>> checkout(CheckoutParams params);
  Future<DataState<PlaceOrderResponse>> placeOrder();
  Future<DataState<GetAllCoupons>> getAllCoupons();
  Future<DataState<BaseResponse>> applyCoupon(String coupon);
  Future<DataState<GetCartResponse>> updateCart(UpdateCartParams params);
}

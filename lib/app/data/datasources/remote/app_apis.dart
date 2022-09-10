import 'dart:developer';
import 'dart:io';

import 'package:direct2u/app/core/constants/app_constants.dart';
import 'package:direct2u/app/domain/entities/auth/verify_otp_for_register_response.dart';
import 'package:direct2u/app/domain/entities/base_response.dart';
import 'package:direct2u/app/domain/entities/cart/place_order_response.dart';
import 'package:direct2u/app/domain/entities/cms/get_cms_response.dart';
import 'package:direct2u/app/domain/entities/products/get_products_response/product.dart';
import 'package:direct2u/app/domain/params/cart/checkout_params.dart';
import 'package:direct2u/app/domain/entities/cart/get_cart_response/get_cart_response.dart';
import 'package:direct2u/app/domain/entities/coupons/get_all_coupons/get_all_coupons.dart';
import 'package:direct2u/app/domain/entities/home_featured_products_type/home_featured_products_type/home_featured_products_type.dart';
import 'package:direct2u/app/domain/entities/notifications/get_notifications_response/get_notifications_response.dart';
import 'package:direct2u/app/domain/entities/products/get_products_response/get_products_response.dart';
import 'package:direct2u/app/domain/entities/user/get_profile_response.dart';
import 'package:direct2u/app/domain/params/address/add_address_params/add_address_params.dart';
import 'package:direct2u/app/domain/params/cart/update_cart_params.dart';
import 'package:direct2u/app/domain/params/cms/add_cms_params.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../domain/entities/address/get_address_response/get_address_response.dart';
import '../../../domain/entities/auth/send_otp_for_register_response/send_otp_for_register_response.dart';
import '../../../domain/entities/banners/banners_response/banners_response.dart';
import '../../../domain/entities/category/get_category_response/get_category_response.dart';
import '../../../domain/entities/orders/get_order_response/get_order_response.dart';
import '../../../domain/params/auth/login_params.dart';
import '../../../domain/params/auth/send_otp_for_register_params.dart';
import '../../../domain/params/auth/verify_otp_for_register_params.dart';
import '../../../domain/params/cart/add_to_cart_params.dart';
import '../../../domain/params/cart/review_product_params.dart';

part 'app_apis.g.dart';

@RestApi(baseUrl: serverBaseUrl)
abstract class AppApis {
  factory AppApis(Dio dio, {String baseUrl}) = _AppApis;

  @POST("otp/sendOtp")
  Future<HttpResponse<SendOtpForRegisterResponse>> sendOTPForRegister(
      @Body() SendOtpForRegisterParams params);

  @POST("otp/verifyOtp")
  Future<HttpResponse<VerifyOtpForRegisterResponse>> verifyOTPForRegister(
      @Body() VerifyOtpForRegisterParams params);

  @GET("category/get/category")
  Future<HttpResponse<GetCategoryResponse>> getCategories();

  @POST("userroute/login")
  Future<HttpResponse<VerifyOtpForRegisterResponse>> login(
      @Body() LoginParams params);

  @GET("banner/getbyquery")
  Future<HttpResponse<BannersResponse>> getBanners(@Query("name") String query);

  @GET("product/getbycat/{id}")
  Future<HttpResponse<GetProductsResponse>> getProductByCategory(
      @Path("id") String category);

  @GET("constantfield/getall")
  Future<HttpResponse<HomeFeaturedProductsType>>
      getAllHomeFeatuedProductsType();

  @GET("constantfield/getbycf/{id}")
  Future<HttpResponse<GetProductsResponse>> getHomeFeaturedProductsById(
      @Path("id") String id);

  @GET("notification/getnotification")
  Future<HttpResponse<GetNotificationsResponse>> getNotifications();

  @POST("cart")
  Future<HttpResponse<BaseResponse>> addToCart(@Body() AddToCartParams body);

  @POST("wishlist/add")
  Future<HttpResponse<BaseResponse>> addToWishlist(
      @Body() AddToCartParams body);

  @GET("userroute/me")
  Future<HttpResponse<GetProfileResponse>> getProfile();

  @GET("cart")
  Future<HttpResponse<GetCartResponse>> getCart();

  @POST("addaddress/me/address")
  Future<HttpResponse<BaseResponse>> addAddress(@Body() AddAddressParams body);

  @GET("addaddress/me/addresses")
  Future<HttpResponse<List<GetAddressResponse>>> getAddress();

  @MultiPart()
  @PATCH("userroute/updateme")
  Future<HttpResponse<BaseResponse>> updateProfile(
      @Part(name: 'name') String name,
      @Part(name: 'email') String email,
      //   @Part(name: 'number') String? alternateNumber,
      @Part(name: 'avatar') File? avatar);

  @POST("order/checkout")
  Future<HttpResponse<BaseResponse>> checkout(CheckoutParams params);

  @POST("order/place-order")
  Future<HttpResponse<PlaceOrderResponse>> placeOrder();

  @GET("coupen")
  Future<HttpResponse<GetAllCoupons>> getAllCoupons();

  @PUT("cart/coupon")
  Future<HttpResponse<BaseResponse>> applyCoupon(
      @Body() Map<String, String> body);

  @PUT("cart")
  Future<HttpResponse<GetCartResponse>> updateCart(
      @Body() UpdateCartParams params);

  @GET("privacypolicy/get")
  Future<HttpResponse<GetCmsResponse>> getPrivacy();

  @GET("tnc/get")
  Future<HttpResponse<GetCmsResponse>> getTnc();

  @POST("hns/add")
  Future<HttpResponse<BaseResponse>> addHelpSupport(
      @Body() AddCmsParams params);

  @GET("order")
  Future<HttpResponse<GetOrderResponse>> getOrder();

  @POST("review/addreview")
  Future<HttpResponse<BaseResponse>> reviewProduct(
      @Body() ReviewProductParams params);

  @GET("product/get/{id}")
  Future<HttpResponse<List<Product>>> getProductById(@Path("id") String id);

  @POST("fblogin/facebook")
  Future<HttpResponse<VerifyOtpForRegisterResponse>> fbLogin(
      @Body() Map<String, String> body);

  @POST("product/search")
  Future<HttpResponse<List<Product>>> searchProduct(
      @Query("title") String title);
}

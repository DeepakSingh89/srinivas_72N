import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/entities/base_response.dart';
import 'package:direct2u/app/domain/entities/cart/place_order_response.dart';
import 'package:direct2u/app/domain/params/cart/checkout_params.dart';
import 'package:direct2u/app/domain/entities/cart/get_cart_response/get_cart_response.dart';
import 'package:direct2u/app/domain/entities/coupons/get_all_coupons/get_all_coupons.dart';
import 'package:direct2u/app/domain/params/cart/update_cart_params.dart';
import 'package:direct2u/app/domain/repository/icart_repository.dart';

import '../../domain/params/cart/add_to_cart_params.dart';

class CartRepositoryImpl extends ICartRepository {
  @override
  Future<DataState<BaseResponse>> addToCart(String id) async {
    try {
      final params = AddToCartParams(product: id);
      log("parms ${params.toJson()}");
      final httpResponse =
          await CommonRepository.getApiService().addToCart(params);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      log("DioError ${e.response.toString()}");
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<GetCartResponse>> getCart() async {
    try {
      final httpResponse = await CommonRepository.getApiService().getCart();
      log("cart ${httpResponse.data.toJson()}");
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      log("DioError ${e.response.toString()}");
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<BaseResponse>> checkout(CheckoutParams params) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().checkout(params);
      log("cart ${httpResponse.data.toJson()}");
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      log("DioError ${e.response.toString()}");
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<GetAllCoupons>> getAllCoupons() async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().getAllCoupons();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      log("DioError ${e.response.toString()}");
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<BaseResponse>> applyCoupon(String coupon) async {
    try {
      final body = {"couponCode": coupon};

      final httpResponse =
          await CommonRepository.getApiService().applyCoupon(body);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      log("DioError ${e.response.toString()}");
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<PlaceOrderResponse>> placeOrder() async {
    try {
      final httpResponse = await CommonRepository.getApiService().placeOrder();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      log("DioError ${e.response.toString()}");
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<GetCartResponse>> updateCart(UpdateCartParams params) async {
    try {
      log("parms ${params.toJson()}");
      final httpResponse =
          await CommonRepository.getApiService().updateCart(params);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      log("DioError ${e.response.toString()}");
      return DataFailed(e);
    }
  }
}

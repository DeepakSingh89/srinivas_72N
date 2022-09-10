import 'dart:developer';
import 'dart:io';

import 'package:direct2u/app/domain/entities/base_response.dart';
import 'package:direct2u/app/domain/entities/category/get_category_response/get_category_response.dart';

import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:dio/dio.dart';
import 'package:direct2u/app/domain/entities/home_featured_products_type/home_featured_products_type/home_featured_products_type.dart';
import 'package:direct2u/app/domain/entities/products/get_products_response/get_products_response.dart';
import 'package:direct2u/app/domain/entities/products/get_products_response/product.dart';
import 'package:direct2u/app/domain/params/cart/review_product_params.dart';
import '../../domain/params/cart/add_to_cart_params.dart';
import '../../domain/repository/iproduct_repository.dart';

class ProductRepositoryImpl extends IProductRepository {
  @override
  Future<DataState<GetCategoryResponse>> getAllCategories() async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().getCategories();

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
  Future<DataState<GetProductsResponse>> getProductsByCategory(
      String id) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().getProductByCategory(id);
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
  Future<DataState<HomeFeaturedProductsType>>
      getHomeFeaturedProductType() async {
    try {
      final httpResponse = await CommonRepository.getApiService()
          .getAllHomeFeatuedProductsType();
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
  Future<DataState<GetProductsResponse>> getHomeFeaturedProducts(
      String id) async {
    try {
      final httpResponse = await CommonRepository.getApiService()
          .getHomeFeaturedProductsById(id);
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
  Future<DataState<BaseResponse>> addToWishlist(String id) async {
    try {
      final params = AddToCartParams(product: id);
      log("parms ${params.toJson()}");
      final httpResponse =
          await CommonRepository.getApiService().addToWishlist(params);

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
  Future<DataState<BaseResponse>> reviewProduct(
      ReviewProductParams params) async {
    try {
      log("parms ${params.toJson()}");
      final httpResponse =
          await CommonRepository.getApiService().reviewProduct(params);

      if (httpResponse.response.statusCode == HttpStatus.created) {
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
  Future<DataState<List<Product>>> getProducById(String id) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().getProductById(id);

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
  Future<DataState<List<Product>>> searchProduct(String query) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().searchProduct(query);

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

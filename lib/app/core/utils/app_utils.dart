import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:get/get.dart';

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/datasources/local/app_database.dart';
import '../../data/datasources/remote/app_apis.dart';
import '../../routes/app_pages.dart';

showToastMessage({required String title, required String message}) {
  Get.snackbar(title, message, duration: const Duration(seconds: 1));
}

abstract class DataState<T> {
  final T? data;
  final DioError? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(DioError error) : super(error: error) {
    debugPrint("error ${error.response.toString()}");
    showToastMessage(
        title: "Error",
        message:
            json.decode(error.response.toString())["message"] ?? error.message);
  }
}

class CommonRepository {
  static AppApis _apiService = AppApis(getDio());

  static AppApis getApiService() {
    return _apiService;
  }

  static setApiService() {
    _apiService = AppApis(getDio());
  }

  static Dio getDio() {
    var token = LocalStorage.readToken();
    log("token $token");
    return Dio(
      BaseOptions(
          contentType: 'application/json', headers: {"Authorization": token}),
    );
  }
}

class AppUtils {
  static void addToCart(String id, RxBool addToCartLoading) async {
    try {
      addToCartLoading.value = true;
      final response = (await cartRepository.addToCart(id)).data;

      addToCartLoading.value = false;
      if (response != null) {
        showToastMessage(title: "Success", message: "Added to cart");
        Get.toNamed(Routes.CART);
      }
    } catch (e) {
      log("e $e");
      addToCartLoading.value = false;
    }
  }
}

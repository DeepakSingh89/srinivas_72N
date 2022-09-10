import 'dart:developer';
import 'dart:io';

import 'package:direct2u/app/domain/entities/address/get_address_response/get_address_response.dart';
import 'package:direct2u/app/domain/entities/base_response.dart';
import 'package:direct2u/app/domain/entities/notifications/get_notifications_response/get_notifications_response.dart';
import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/entities/user/get_profile_response.dart';
import 'package:direct2u/app/domain/params/address/add_address_params/add_address_params.dart';
import 'package:direct2u/app/domain/repository/iuser_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl extends IUserRepository {
  @override
  Future<DataState<GetNotificationsResponse>> getNotifications() async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().getNotifications();

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
  Future<DataState<BaseResponse>> addAddress(AddAddressParams params) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().addAddress(params);

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
  Future<DataState<List<GetAddressResponse>>> getAddress() async {
    try {
      final httpResponse = await CommonRepository.getApiService().getAddress();

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
  Future<DataState<BaseResponse>> updateProfile(
      String name, String email, File? image) async {
    try {
      final httpResponse = await CommonRepository.getApiService()
          .updateProfile(name, email, image);
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
  Future<DataState<GetProfileResponse>> getProfile() async {
    try {
      final httpResponse = await CommonRepository.getApiService().getProfile();

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
}

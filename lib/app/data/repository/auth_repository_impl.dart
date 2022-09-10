import 'dart:developer';
import 'dart:io';

import 'package:direct2u/app/domain/entities/auth/verify_otp_for_register_response.dart';
import 'package:direct2u/app/domain/params/auth/login_params.dart';
import 'package:direct2u/app/domain/params/auth/send_otp_for_register_params.dart';

import 'package:direct2u/app/domain/entities/auth/send_otp_for_register_response/send_otp_for_register_response.dart';

import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/params/auth/verify_otp_for_register_params.dart';

import '../../domain/repository/iauth_repository.dart';

import 'package:dio/dio.dart';

class AuthRepositoryImpl extends IAuthRepository {
  @override
  Future<DataState<SendOtpForRegisterResponse>> sendOTPforRegister(
      SendOtpForRegisterParams params) async {
    try {
      log("params $params");

      final httpResponse =
          await CommonRepository.getApiService().sendOTPForRegister(params);

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
  Future<DataState<VerifyOtpForRegisterResponse>> verifyOTPForRegister(
      VerifyOtpForRegisterParams params) async {
    try {
      log("params $params");

      final httpResponse =
          await CommonRepository.getApiService().verifyOTPForRegister(params);

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
  Future<DataState<VerifyOtpForRegisterResponse>> login(
      LoginParams params) async {
    try {
      log("params ${params.toJson()}");

      final httpResponse = await CommonRepository.getApiService().login(params);

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
  Future<DataState<VerifyOtpForRegisterResponse>> fbLogin(String token) async {
    try {
      log("params $token");
      final map = {"fbToken": token};
      final httpResponse = await CommonRepository.getApiService().fbLogin(map);
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

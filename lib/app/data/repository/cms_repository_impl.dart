import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:direct2u/app/domain/entities/base_response.dart';
import 'package:direct2u/app/domain/entities/cms/get_cms_response.dart';
import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/params/cms/add_cms_params.dart';
import 'package:direct2u/app/domain/repository/icms_repository.dart';

class CMSRepositoryImpl extends ICMSRepository {
  @override
  Future<DataState<GetCmsResponse>> getPrivacyPolicy() async {
    try {
      final httpResponse = await CommonRepository.getApiService().getPrivacy();

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
  Future<DataState<GetCmsResponse>> getTnc() async {
    try {
      final httpResponse = await CommonRepository.getApiService().getTnc();

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
  Future<DataState<BaseResponse>> addHelpSupport(AddCmsParams params) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().addHelpSupport(params);

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

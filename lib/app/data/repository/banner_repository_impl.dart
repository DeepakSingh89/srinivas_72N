import 'dart:developer';
import 'dart:io';

import 'package:direct2u/app/domain/entities/banners/banners_response/banners_response.dart';

import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:dio/dio.dart';
import 'package:direct2u/app/domain/repository/ibanners_reposiory.dart';

class BannerRepositoryImpl extends IBannersRepository {
  @override
  Future<DataState<BannersResponse>> getBanners(String query) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().getBanners(query);

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

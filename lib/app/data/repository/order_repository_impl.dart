import 'dart:developer';
import 'dart:io';

import 'package:direct2u/app/domain/entities/orders/get_order_response/get_order_response.dart';
import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/repository/iorder_repository.dart';
import 'package:dio/dio.dart';

class OrderRepositoryImpl extends IOrderRepository {
  @override
  Future<DataState<GetOrderResponse>> getOrders() async {
    try {
      final httpResponse = await CommonRepository.getApiService().getOrder();

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

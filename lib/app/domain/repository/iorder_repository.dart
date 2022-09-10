import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/entities/orders/get_order_response/get_order_response.dart';

abstract class IOrderRepository {
  Future<DataState<GetOrderResponse>> getOrders();
}

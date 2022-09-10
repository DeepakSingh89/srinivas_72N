import 'order.dart';

class GetOrderResponse {
  bool? success;
  String? msg;
  List<Order>? orders;

  GetOrderResponse({this.success, this.msg, this.orders});

  factory GetOrderResponse.fromJson(Map<String, dynamic> json) {
    return GetOrderResponse(
      success: json['success'] as bool?,
      msg: json['msg'] as String?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'msg': msg,
        'orders': orders?.map((e) => e.toJson()).toList(),
      };
}

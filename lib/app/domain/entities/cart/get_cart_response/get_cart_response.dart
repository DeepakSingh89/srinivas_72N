import 'cart.dart';

class GetCartResponse {
  bool? success;
  String? msg;
  Cart? cart;

  GetCartResponse({this.success, this.msg, this.cart});

  factory GetCartResponse.fromJson(Map<String, dynamic> json) {
    return GetCartResponse(
      success: json['success'] as bool?,
      msg: json['msg'] as String?,
      cart: json['cart'] == null
          ? null
          : Cart.fromJson(json['cart'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'msg': msg,
        'cart': cart?.toJson(),
      };
}

class PlaceOrderResponse {
  String? msg;
  String? orderId;
  int? amount;

  PlaceOrderResponse({this.msg, this.orderId, this.amount});

  factory PlaceOrderResponse.fromJson(Map<String, dynamic> json) {
    return PlaceOrderResponse(
      msg: json['msg'] as String?,
      orderId: json['orderId'] as String?,
      amount: json['amount'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'orderId': orderId,
        'amount': amount,
      };
}

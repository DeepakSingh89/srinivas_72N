class UpdateCartParams {
  String? product;
  int? quantity;

  UpdateCartParams({this.product, this.quantity});

  factory UpdateCartParams.fromJson(Map<String, dynamic> json) {
    return UpdateCartParams(
      product: json['product'] as String?,
      quantity: json['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'product': product,
        'quantity': quantity,
      };
}

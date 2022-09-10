class AddToCartParams {
  String? product;

  AddToCartParams({this.product});

  factory AddToCartParams.fromJson(Map<String, dynamic> json) {
    return AddToCartParams(
      product: json['product'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'product': product,
      };
}

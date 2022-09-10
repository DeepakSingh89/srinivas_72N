class CheckoutParams {
  String? address;
  String? coupon;

  CheckoutParams({this.address, this.coupon});

  factory CheckoutParams.fromJson(Map<String, dynamic> json) {
    return CheckoutParams(
      address: json['address'] as String?,
      coupon: json['coupon'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'address': address,
        'coupon': coupon,
      };
}

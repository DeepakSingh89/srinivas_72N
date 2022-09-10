class Coupon {
  String? id;
  String? couponCode;
  DateTime? expirationDate;
  int? discount;

  Coupon({this.id, this.couponCode, this.expirationDate, this.discount});

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json['_id'] as String?,
        couponCode: json['couponCode'] as String?,
        expirationDate: json['expirationDate'] == null
            ? null
            : DateTime.parse(json['expirationDate'] as String),
        discount: json['discount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'couponCode': couponCode,
        'expirationDate': expirationDate?.toIso8601String(),
        'discount': discount,
      };
}

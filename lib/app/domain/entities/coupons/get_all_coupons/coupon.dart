class Coupon {
  String? id;
  String? couponCode;
  DateTime? expirationDate;
  DateTime? activationDate;
  num? discount;
  num? minOrder;
  num? v;

  Coupon({
    this.id,
    this.couponCode,
    this.expirationDate,
    this.activationDate,
    this.discount,
    this.minOrder,
    this.v,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json['_id'] as String?,
        couponCode: json['couponCode'] as String?,
        expirationDate: json['expirationDate'] == null
            ? null
            : DateTime.parse(json['expirationDate'] as String),
        activationDate: json['activationDate'] == null
            ? null
            : DateTime.parse(json['activationDate'] as String),
        discount: json['discount'] as num?,
        minOrder: json['minOrder'] as num?,
        v: json['__v'] as num?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'couponCode': couponCode,
        'expirationDate': expirationDate?.toIso8601String(),
        'activationDate': activationDate?.toIso8601String(),
        'discount': discount,
        'minOrder': minOrder,
        '__v': v,
      };
}

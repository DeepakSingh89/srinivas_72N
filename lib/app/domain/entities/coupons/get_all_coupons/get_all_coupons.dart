import 'coupon.dart';

class GetAllCoupons {
  bool? success;
  String? msg;
  List<Coupon>? coupons;

  GetAllCoupons({this.success, this.msg, this.coupons});

  factory GetAllCoupons.fromJson(Map<String, dynamic> json) => GetAllCoupons(
        success: json['success'] as bool?,
        msg: json['msg'] as String?,
        coupons: (json['coupons'] as List<dynamic>?)
            ?.map((e) => Coupon.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'msg': msg,
        'coupons': coupons?.map((e) => e.toJson()).toList(),
      };
}

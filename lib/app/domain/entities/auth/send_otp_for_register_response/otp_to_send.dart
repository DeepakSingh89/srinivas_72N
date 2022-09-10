class OtpToSend {
  String? mobile;
  String? otp;
  String? id;
  DateTime? createdAt;
  int? v;

  OtpToSend({this.mobile, this.otp, this.id, this.createdAt, this.v});

  factory OtpToSend.fromJson(Map<String, dynamic> json) => OtpToSend(
        mobile: json['mobile'] as String?,
        otp: json['otp'] as String?,
        id: json['_id'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
        'otp': otp,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        '__v': v,
      };
}

class GetProfileResponse {
  String? id;
  String? mobile;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? avatar;
  String? email;
  String? name;

  GetProfileResponse({
    this.id,
    this.mobile,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.avatar,
    this.email,
    this.name,
  });

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileResponse(
      id: json['_id'] as String?,
      mobile: json['mobile'] as String?,
      isVerified: json['isVerified'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'mobile': mobile,
        'isVerified': isVerified,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'avatar': avatar,
        'email': email,
        'name': name,
      };
}

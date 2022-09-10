class Result {
  String? id;
  String? bannername;
  String? bannerimg;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Result({
    this.id,
    this.bannername,
    this.bannerimg,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['_id'] as String?,
        bannername: json['bannername'] as String?,
        bannerimg: json['bannerimg'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'bannername': bannername,
        'bannerimg': bannerimg,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}

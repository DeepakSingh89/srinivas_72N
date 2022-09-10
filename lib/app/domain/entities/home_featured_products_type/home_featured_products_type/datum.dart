class Datum {
  String? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({this.id, this.name, this.createdAt, this.updatedAt, this.v});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['_id'] as String?,
        name: json['NAME'] as String?,
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
        'NAME': name,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}

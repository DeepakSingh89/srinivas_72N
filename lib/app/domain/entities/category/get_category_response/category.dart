class Category {
  String? id;
  String? category;
  String? categoryimg;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Category({
    this.id,
    this.category,
    this.categoryimg,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['_id'] as String?,
        category: json['category'] as String?,
        categoryimg: json['categoryimg'] as String?,
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
        'category': category,
        'categoryimg': categoryimg,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}

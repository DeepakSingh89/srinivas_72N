class GetNotification {
  String? id;
  String? notification;
  String? title;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  GetNotification({
    this.id,
    this.notification,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory GetNotification.fromJson(Map<String, dynamic> json) {
    return GetNotification(
      id: json['_id'] as String?,
      notification: json['notification'] as String?,
      title: json['title'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'notification': notification,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}

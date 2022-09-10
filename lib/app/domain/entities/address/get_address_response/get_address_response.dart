import 'address.dart';

class GetAddressResponse {
  Address? address;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  GetAddressResponse({
    this.address,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory GetAddressResponse.fromJson(Map<String, dynamic> json) {
    return GetAddressResponse(
      address: json['Address'] == null
          ? null
          : Address.fromJson(json['Address'] as Map<String, dynamic>),
      id: json['_id'] as String?,
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
        'Address': address?.toJson(),
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}

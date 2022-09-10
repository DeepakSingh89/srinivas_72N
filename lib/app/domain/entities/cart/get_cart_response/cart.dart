import 'product.dart';

class Cart {
  String? id;
  String? user;
  List<CartProduct>? products;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? v;
  num? subTotal;
  num? discount;
  num? total;
  num? shipping;

  Cart({
    this.id,
    this.user,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.subTotal,
    this.discount,
    this.total,
    this.shipping,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json['_id'] as String?,
        user: json['user'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as num?,
        subTotal: json['subTotal'] as num?,
        discount: json['discount'] as num?,
        total: json['total'] as num?,
        shipping: json['shipping'] as num?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user,
        'products': products?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'subTotal': subTotal,
        'discount': discount,
        'total': total,
        'shipping': shipping,
      };
}

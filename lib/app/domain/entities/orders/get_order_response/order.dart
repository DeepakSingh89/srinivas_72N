import '../../cart/get_cart_response/product.dart';
import 'coupon.dart';

class Order {
  String? id;
  String? user;
  String? paymentStatus;
  int? grandTotal;
  double? discount;
  int? shippingPrice;
  double? amountToBePaid;
  bool? delivered;
  List<CartProduct>? products;
  Coupon? coupon;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Order({
    this.id,
    this.user,
    this.paymentStatus,
    this.grandTotal,
    this.discount,
    this.shippingPrice,
    this.amountToBePaid,
    this.delivered,
    this.products,
    this.coupon,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['_id'] as String?,
        user: json['user'] as String?,
        paymentStatus: json['paymentStatus'] as String?,
        grandTotal: json['grandTotal'] as int?,
        discount: (json['discount'] as num?)?.toDouble(),
        shippingPrice: json['shippingPrice'] as int?,
        amountToBePaid: (json['amountToBePaid'] as num?)?.toDouble(),
        delivered: json['delivered'] as bool?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        coupon: json['coupon'] == null
            ? null
            : Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
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
        'user': user,
        'paymentStatus': paymentStatus,
        'grandTotal': grandTotal,
        'discount': discount,
        'shippingPrice': shippingPrice,
        'amountToBePaid': amountToBePaid,
        'delivered': delivered,
        'products': products?.map((e) => e.toJson()).toList(),
        'coupon': coupon?.toJson(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}

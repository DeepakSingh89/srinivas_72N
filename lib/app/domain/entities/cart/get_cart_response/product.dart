import '../../products/get_products_response/product.dart';

class CartProduct {
  Product? product;
  num? quantity;
  num? total;

  CartProduct({this.product, this.quantity, this.total});

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
        quantity: json['quantity'] as num?,
        total: json['total'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'product': product?.toJson(),
        'quantity': quantity,
        'total': total,
      };
}

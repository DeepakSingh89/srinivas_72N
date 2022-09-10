import 'product.dart';

class GetProductsResponse {
  List<Product>? products;

  GetProductsResponse({this.products});

  factory GetProductsResponse.fromJson(Map<String, dynamic> json) {
    return GetProductsResponse(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
      };
}

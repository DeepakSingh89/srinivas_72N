import 'package:get/get.dart';

import 'product_picture.dart';

class Product {
  String? id;
  String? title;
  String? description;
  List<ProductPicture>? productPictures;
  num? mrp;
  num? mop;
  List<dynamic>? color;
  bool? instock;
  String? brand;
  List<dynamic>? attributes;
  String? featuredDetails;
  String? productInformation;
  String? returnPolicy;
  String? productCode;
  String? productHsnCode;
  String? taxIgst;
  num? withoutGstPrice;
  String? category;
  String? constantField;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? v;
  RxBool? iswishlisted;

  Product(
      {this.id,
      this.title,
      this.description,
      this.productPictures,
      this.mrp,
      this.mop,
      this.color,
      this.instock,
      this.brand,
      this.attributes,
      this.featuredDetails,
      this.productInformation,
      this.returnPolicy,
      this.productCode,
      this.productHsnCode,
      this.taxIgst,
      this.withoutGstPrice,
      this.category,
      this.constantField,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.iswishlisted});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      productPictures: (json['productPictures'] as List<dynamic>?)
          ?.map((e) => ProductPicture.fromJson(e as Map<String, dynamic>))
          .toList(),
      mrp: json['MRP'] as num?,
      mop: json['MOP'] as num?,
      color: json['color'] as List<dynamic>?,
      instock: json['instock'] as bool?,
      brand: json['brand'] as String?,
      attributes: json['attributes'] as List<dynamic>?,
      featuredDetails: json['featured_details'] as String?,
      productInformation: json['product_information'] as String?,
      returnPolicy: json['return_policy'] as String?,
      productCode: json['product_code'] as String?,
      productHsnCode: json['product_hsn_code'] as String?,
      taxIgst: json['Tax_igst'] as String?,
      withoutGstPrice: json['Without_gst_price'] as num?,
      category: json['category'] as String?,
      constantField: json['ConstantField'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as num?,
      iswishlisted: json['iswishlisted'] != null
          ? RxBool(json['iswishlisted'] as bool)
          : null);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'description': description,
        'productPictures': productPictures?.map((e) => e.toJson()).toList(),
        'MRP': mrp,
        'MOP': mop,
        'color': color,
        'instock': instock,
        'brand': brand,
        'attributes': attributes,
        'featured_details': featuredDetails,
        'product_information': productInformation,
        'return_policy': returnPolicy,
        'product_code': productCode,
        'product_hsn_code': productHsnCode,
        'Tax_igst': taxIgst,
        'Without_gst_price': withoutGstPrice,
        'category': category,
        'ConstantField': constantField,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}

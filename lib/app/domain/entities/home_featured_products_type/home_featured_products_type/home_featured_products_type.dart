import 'datum.dart';

class HomeFeaturedProductsType {
  List<Datum>? data;

  HomeFeaturedProductsType({this.data});

  factory HomeFeaturedProductsType.fromJson(Map<String, dynamic> json) {
    return HomeFeaturedProductsType(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

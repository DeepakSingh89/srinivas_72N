import 'category.dart';

class GetCategoryResponse {
  List<Category>? categories;

  GetCategoryResponse({this.categories});

  factory GetCategoryResponse.fromJson(Map<String, dynamic> json) {
    return GetCategoryResponse(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'categories': categories?.map((e) => e.toJson()).toList(),
      };
}

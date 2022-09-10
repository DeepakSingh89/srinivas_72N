class ReviewProductParams {
  String? review;
  int? starRating;
  String? product;

  ReviewProductParams({this.review, this.starRating, this.product});

  factory ReviewProductParams.fromJson(Map<String, dynamic> json) =>
      ReviewProductParams(
        review: json['review'] as String?,
        starRating: json['star_rating'] as int?,
        product: json['product'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'review': review,
        'star_rating': starRating,
        'product': product,
      };
}

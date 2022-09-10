class ProductPicture {
  String? img;
  String? id;

  ProductPicture({this.img, this.id});

  factory ProductPicture.fromJson(Map<String, dynamic> json) {
    return ProductPicture(
      img: json['img'] as String?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'img': img,
        '_id': id,
      };
}

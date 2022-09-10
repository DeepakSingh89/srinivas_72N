class GetCmsResponse {
  String? description;
  String? id;

  GetCmsResponse({this.description, this.id});

  factory GetCmsResponse.fromJson(Map<String, dynamic> json) {
    return GetCmsResponse(
      description: json['description'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'id': id,
      };
}

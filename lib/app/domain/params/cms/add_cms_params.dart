class AddCmsParams {
  String? name;
  String? query;
  String? email;
  String? mobile;

  AddCmsParams({this.name, this.query, this.email, this.mobile});

  factory AddCmsParams.fromJson(Map<String, dynamic> json) => AddCmsParams(
        name: json['name'] as String?,
        query: json['query'] as String?,
        email: json['email'] as String?,
        mobile: json['mobile'] as String?,
      );

  Map<String, dynamic> toJson() =>
      {'name': name, 'query': query, 'email': email, 'mobile': mobile};
}

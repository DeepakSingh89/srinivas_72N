class LoginParams {
  String? mobile;
  String? password;

  LoginParams({this.mobile, this.password});

  factory LoginParams.fromJson(Map<String, dynamic> json) => LoginParams(
        mobile: json['mobile'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
        'password': password,
      };
}

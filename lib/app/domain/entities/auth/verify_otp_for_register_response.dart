class VerifyOtpForRegisterResponse {
  String? token;

  VerifyOtpForRegisterResponse({this.token});

  factory VerifyOtpForRegisterResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpForRegisterResponse(
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}

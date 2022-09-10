class SendOtpForRegisterParams {
  String? mobile;
  String? pswd1;
  String? pswd2;

  SendOtpForRegisterParams({this.mobile, this.pswd1, this.pswd2});

  factory SendOtpForRegisterParams.fromJson(Map<String, dynamic> json) {
    return SendOtpForRegisterParams(
      mobile: json['mobile'] as String?,
      pswd1: json['pswd1'] as String?,
      pswd2: json['pswd2'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
        'pswd1': pswd1,
        'pswd2': pswd2,
      };
}

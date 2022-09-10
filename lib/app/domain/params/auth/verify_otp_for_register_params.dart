class VerifyOtpForRegisterParams {
  String? mobile;
  String? otpEnterByUser;
  String? password;

  VerifyOtpForRegisterParams({
    this.mobile,
    this.otpEnterByUser,
    this.password,
  });

  factory VerifyOtpForRegisterParams.fromJson(Map<String, dynamic> json) {
    return VerifyOtpForRegisterParams(
      mobile: json['mobile'] as String?,
      otpEnterByUser: json['otpEnterByUser'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
        'otpEnterByUser': otpEnterByUser,
        'password': password,
      };
}

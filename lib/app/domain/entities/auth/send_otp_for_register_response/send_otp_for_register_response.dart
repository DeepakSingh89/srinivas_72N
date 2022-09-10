import 'otp_to_send.dart';

class SendOtpForRegisterResponse {
  String? otp;
  OtpToSend? otpToSend;

  SendOtpForRegisterResponse({this.otp, this.otpToSend});

  factory SendOtpForRegisterResponse.fromJson(Map<String, dynamic> json) {
    return SendOtpForRegisterResponse(
      otp: json['otp'] as String?,
      otpToSend: json['otpToSend'] == null
          ? null
          : OtpToSend.fromJson(json['otpToSend'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'otp': otp,
        'otpToSend': otpToSend?.toJson(),
      };
}

import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/entities/auth/verify_otp_for_register_response.dart';
import 'package:direct2u/app/domain/params/auth/send_otp_for_register_params.dart';
import 'package:direct2u/app/domain/params/auth/verify_otp_for_register_params.dart';

import '../entities/auth/send_otp_for_register_response/send_otp_for_register_response.dart';
import '../params/auth/login_params.dart';

abstract class IAuthRepository {
  Future<DataState<SendOtpForRegisterResponse>> sendOTPforRegister(
      SendOtpForRegisterParams params);
  Future<DataState<VerifyOtpForRegisterResponse>> verifyOTPForRegister(
      VerifyOtpForRegisterParams params);
  Future<DataState<VerifyOtpForRegisterResponse>> login(LoginParams params);
  Future<DataState<VerifyOtpForRegisterResponse>> fbLogin(String token);
}

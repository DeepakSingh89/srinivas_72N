import 'dart:io';

import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/entities/address/get_address_response/get_address_response.dart';
import 'package:direct2u/app/domain/entities/base_response.dart';
import 'package:direct2u/app/domain/entities/notifications/get_notifications_response/get_notifications_response.dart';
import 'package:direct2u/app/domain/entities/user/get_profile_response.dart';
import 'package:direct2u/app/domain/params/address/add_address_params/add_address_params.dart';

abstract class IUserRepository {
  Future<DataState<GetNotificationsResponse>> getNotifications();
  Future<DataState<List<GetAddressResponse>>> getAddress();
  Future<DataState<BaseResponse>> addAddress(AddAddressParams params);
  Future<DataState<GetProfileResponse>> getProfile();
  Future<DataState<BaseResponse>> updateProfile(
      String name, String email, File? image);
}

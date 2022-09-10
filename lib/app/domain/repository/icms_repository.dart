import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/entities/cms/get_cms_response.dart';
import 'package:direct2u/app/domain/params/cms/add_cms_params.dart';

import '../entities/base_response.dart';

abstract class ICMSRepository {
  Future<DataState<GetCmsResponse>> getPrivacyPolicy();
  Future<DataState<GetCmsResponse>> getTnc();
  Future<DataState<BaseResponse>> addHelpSupport(AddCmsParams params);
}

import 'package:direct2u/app/core/utils/app_utils.dart';
import 'package:direct2u/app/domain/entities/banners/banners_response/banners_response.dart';

abstract class IBannersRepository {
  Future<DataState<BannersResponse>> getBanners(String query);
}

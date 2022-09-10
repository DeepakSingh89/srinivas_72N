import 'package:get/get.dart';
import '../../../core/utils/app_repositories.dart';
import '../../../domain/entities/banners/banners_response/result.dart';
import '../../../domain/entities/category/get_category_response/category.dart';

class CategoriesController extends GetxController {
  final categoriesLoading = false.obs;
  final topBannerLoading = false.obs;
  late final categories = <Category>[].obs;
  late final topBanner = <Result>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
    getTopBanners();
  }

  getAllCategories() async {
    categoriesLoading.value = true;
    try {
      categories.value =
          (await productRepository.getAllCategories()).data?.categories ?? [];
      categoriesLoading.value = false;
    } catch (e) {
      categories.value = <Category>[];
      categoriesLoading.value = false;
    }
  }

  getTopBanners() async {
    topBannerLoading.value = true;
    try {
      topBanner.value =
          (await bannersRepository.getBanners("category")).data?.result ?? [];
      topBannerLoading.value = false;
    } catch (e) {
      topBanner.value = <Result>[];
      topBannerLoading.value = false;
    }
  }
}

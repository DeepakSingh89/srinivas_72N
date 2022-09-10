import 'dart:developer';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:direct2u/app/domain/entities/banners/banners_response/result.dart';
import 'package:direct2u/app/domain/entities/category/get_category_response/category.dart';
import 'package:get/get.dart';

import '../../../domain/entities/home_featured_products_type/home_featured_products_type/datum.dart';
import '../../../domain/entities/products/get_products_response/product.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final categoriesLoading = false.obs;

  final topBannerLoading = false.obs;
  final midlleBannerLoading = false.obs;
  final bottomBannerLoading = false.obs;

  late final categories = <Category>[].obs;

  late final topBanner = <Result>[].obs;
  late final middleBanner = <Result>[].obs;
  late final bottomBanner = <Result>[].obs;

  final firstFeaturedProductsLoading = false.obs;
  final secondFeaturedProductsLoading = false.obs;

  late final homeFeaturedProductsType = <Datum>[].obs;
  late final homeFeaturedProductsTypeLoading = false.obs;

  late final firstFeaturedProductName = "Top Deals".obs;
  late final firstFeaturedProducts = <Product>[].obs;
  final firstFeaturedProductLoading = false.obs;

  late final secondFeaturedProductName = "Recommended for you".obs;
  late final secondFeaturedProducts = <Product>[].obs;
  final secondFeaturedProductLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
    getTopBanners();
    getMiddleBanner();
    getBottomBanner();
    getHomeFeaturedProuctsTypes();
  }

  getHomeFeaturedProuctsTypes() async {
    try {
      homeFeaturedProductsTypeLoading.value = true;
      homeFeaturedProductsType.value =
          (await productRepository.getHomeFeaturedProductType()).data?.data ??
              [];
      homeFeaturedProductsTypeLoading.value = false;
      if (homeFeaturedProductsType.isNotEmpty) {
        await getFirstFeauredProduct();
        if (homeFeaturedProductsType.length > 1) {
          await getSecondFeauredProduct();
        }
      }
    } catch (e) {
      log("e $e");
      homeFeaturedProductsTypeLoading.value = false;
      firstFeaturedProductLoading.value = false;
      secondFeaturedProductLoading.value = false;
    }
  }

  Future<void> getFirstFeauredProduct() async {
    firstFeaturedProductLoading.value = true;
    firstFeaturedProducts.value = (await productRepository
                .getHomeFeaturedProducts(homeFeaturedProductsType.first.id!))
            .data
            ?.products ??
        [];
    firstFeaturedProductName.value =
        homeFeaturedProductsType.first.name ?? "n/a";
    firstFeaturedProductLoading.value = false;
  }

  Future<void> getSecondFeauredProduct() async {
    secondFeaturedProductLoading.value = true;
    secondFeaturedProducts.value = (await productRepository
                .getHomeFeaturedProducts(homeFeaturedProductsType[1].id!))
            .data
            ?.products ??
        [];
    secondFeaturedProductName.value = homeFeaturedProductsType[1].name ?? "n/a";
    secondFeaturedProductLoading.value = false;
  }

  getAllCategories() async {
    categoriesLoading.value = true;
    try {
      categories.value =
          (await productRepository.getAllCategories()).data?.categories ?? [];
      categoriesLoading.value = false;
    } catch (e) {
      log("e $e");
      categories.value = <Category>[];
      categoriesLoading.value = false;
    }
  }

  getTopBanners() async {
    topBannerLoading.value = true;
    try {
      topBanner.value =
          (await bannersRepository.getBanners("top")).data?.result ?? [];
      topBannerLoading.value = false;
    } catch (e) {
      log("e $e");
      topBanner.value = <Result>[];
      topBannerLoading.value = false;
    }
  }

  getMiddleBanner() async {
    midlleBannerLoading.value = true;
    try {
      middleBanner.value =
          (await bannersRepository.getBanners("middle")).data?.result ?? [];
      midlleBannerLoading.value = false;
    } catch (e) {
      log("e $e");
      middleBanner.value = <Result>[];
      midlleBannerLoading.value = false;
    }
  }

  getBottomBanner() async {
    bottomBannerLoading.value = true;
    try {
      bottomBanner.value =
          (await bannersRepository.getBanners("bottom")).data?.result ?? [];
      bottomBannerLoading.value = false;
    } catch (e) {
      log("e $e");
      bottomBanner.value = <Result>[];
      bottomBannerLoading.value = false;
    }
  }

  void increment() => count.value++;
}

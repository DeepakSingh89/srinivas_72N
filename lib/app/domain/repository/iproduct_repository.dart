import 'package:direct2u/app/domain/entities/base_response.dart';
import 'package:direct2u/app/domain/entities/category/get_category_response/get_category_response.dart';
import 'package:direct2u/app/domain/entities/home_featured_products_type/home_featured_products_type/home_featured_products_type.dart';
import 'package:direct2u/app/domain/entities/products/get_products_response/get_products_response.dart';
import 'package:direct2u/app/domain/entities/products/get_products_response/product.dart';
import 'package:direct2u/app/domain/params/cart/review_product_params.dart';

import '../../core/utils/app_utils.dart';

abstract class IProductRepository {
  Future<DataState<GetCategoryResponse>> getAllCategories();
  Future<DataState<GetProductsResponse>> getProductsByCategory(String id);
  Future<DataState<GetProductsResponse>> getHomeFeaturedProducts(String id);
  Future<DataState<HomeFeaturedProductsType>> getHomeFeaturedProductType();
  Future<DataState<BaseResponse>> addToWishlist(String id);
  Future<DataState<BaseResponse>> reviewProduct(ReviewProductParams params);
  Future<DataState<List<Product>>> getProducById(String id);
  Future<DataState<List<Product>>> searchProduct(String query);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_apis.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _AppApis implements AppApis {
  _AppApis(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://dtou.herokuapp.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<SendOtpForRegisterResponse>> sendOTPForRegister(
      params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<SendOtpForRegisterResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'otp/sendOtp',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SendOtpForRegisterResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<VerifyOtpForRegisterResponse>> verifyOTPForRegister(
      params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<VerifyOtpForRegisterResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'otp/verifyOtp',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VerifyOtpForRegisterResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetCategoryResponse>> getCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetCategoryResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'category/get/category',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCategoryResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<VerifyOtpForRegisterResponse>> login(params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<VerifyOtpForRegisterResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'userroute/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VerifyOtpForRegisterResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BannersResponse>> getBanners(query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'name': query};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BannersResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'banner/getbyquery',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BannersResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetProductsResponse>> getProductByCategory(
      category) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetProductsResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'product/getbycat/${category}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetProductsResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<HomeFeaturedProductsType>>
      getAllHomeFeatuedProductsType() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<HomeFeaturedProductsType>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'constantfield/getall',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HomeFeaturedProductsType.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetProductsResponse>> getHomeFeaturedProductsById(
      id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetProductsResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'constantfield/getbycf/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetProductsResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetNotificationsResponse>> getNotifications() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetNotificationsResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'notification/getnotification',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetNotificationsResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse>> addToCart(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'cart',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse>> addToWishlist(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'wishlist/add',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetProfileResponse>> getProfile() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetProfileResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'userroute/me',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetProfileResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetCartResponse>> getCart() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetCartResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'cart',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCartResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse>> addAddress(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'addaddress/me/address',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<GetAddressResponse>>> getAddress() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<GetAddressResponse>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'addaddress/me/addresses',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            GetAddressResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse>> updateProfile(name, email, avatar) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('name', name));
    _data.fields.add(MapEntry('email', email));
    if (avatar != null)
      _data.files.add(MapEntry(
          'avatar',
          MultipartFile.fromFileSync(avatar.path,
              filename: avatar.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse>>(Options(
                method: 'PATCH',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, 'userroute/updateme',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse>> checkout(params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'order/checkout',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<PlaceOrderResponse>> placeOrder() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<PlaceOrderResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'order/place-order',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PlaceOrderResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetAllCoupons>> getAllCoupons() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetAllCoupons>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'coupen',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetAllCoupons.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse>> applyCoupon(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'cart/coupon',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetCartResponse>> updateCart(params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetCartResponse>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'cart',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCartResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetCmsResponse>> getPrivacy() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetCmsResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'privacypolicy/get',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCmsResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetCmsResponse>> getTnc() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetCmsResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'tnc/get',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCmsResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse>> addHelpSupport(params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'hns/add',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetOrderResponse>> getOrder() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetOrderResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'order',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetOrderResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse>> reviewProduct(params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'review/addreview',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<Product>>> getProductById(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<Product>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'product/get/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Product.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<VerifyOtpForRegisterResponse>> fbLogin(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<VerifyOtpForRegisterResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'fblogin/facebook',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VerifyOtpForRegisterResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<Product>>> searchProduct(title) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'title': title};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<Product>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'product/search',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Product.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

import 'dart:async';
import 'dart:developer';
import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../main.dart';
import '../../../domain/entities/products/get_products_response/product.dart';

class SearchProductsController extends GetxController {
  String query = "";
  StreamController<String> streamController = StreamController();
  final loading = false.obs;

  late final products = <Product>[].obs;
  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    query = Get.arguments;
    textController.text = query;
    searchProduct();
    streamController.stream
        .transform(StreamTransformer.fromBind(
            (s) => s.debounce(const Duration(milliseconds: 2000))))
        .listen((s) {
      query = s;
      searchProduct();
    });
  }

  voiceSearch() async {
    speechToText.listen(onResult: ((result) {
      log("result ${result.recognizedWords}");
      query = result.recognizedWords;
      textController.text = query;
      searchProduct();
    }));
  }

  searchProduct() async {
    loading.value = true;
    try {
      products.value =
          (await productRepository.searchProduct(query)).data ?? [];
      log("length $products");
      loading.value = false;
    } catch (er) {
      log("er $er");
      loading.value = false;
    }
  }
}

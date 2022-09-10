import 'dart:async';

import 'package:direct2u/app/core/utils/app_repositories.dart';
import 'package:stream_transform/stream_transform.dart';
import 'dart:developer';
import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/routes/app_pages.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../../main.dart';

class MainController extends GetxController {
  late final PersistentTabController persistentController;
  StreamController<String> streamController = StreamController();

  @override
  void onInit() async {
    super.onInit();
    persistentController = PersistentTabController(initialIndex: 0);
    streamController.stream
        .transform(StreamTransformer.fromBind(
            (s) => s.debounce(const Duration(milliseconds: 2000))))
        .listen((s) {
      log("s $s");
      Get.toNamed(Routes.SEARCH_PRODUCTS, arguments: s);
    });
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) async {
      final String? id = dynamicLinkData.link.queryParameters["product"];
      if (id != null) {
        buildDialogLoadingIndicator();
        final product = (await productRepository.getProducById(id)).data?.first;
        Get.back();
        Get.toNamed(Routes.PRODUCT_DETAIL, arguments: product);
      }
    }).onError((error) {
      // Handle errors
    });
  }

  voiceSearch() async {
    speechToText.listen(onResult: ((result) {
      log("result ${result.recognizedWords}");
      if (result.finalResult && result.recognizedWords.isNotEmpty) {
        Get.toNamed(Routes.SEARCH_PRODUCTS, arguments: result.recognizedWords);
      }
    }));
  }
}

import 'package:flutter_seer/pages/card_detail_page.dart';
import 'package:flutter_seer/pages/card_list_page.dart';
import 'package:flutter_seer/pages/splash_page.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'app_logger.dart';

class RoutePath {
  static const String index = '/';
  static const String splash = '/splash';
  static const String home = '/home';
  static const String search = '/search';
  static const String cardList = '/card_list';
  static const String cardDetail = '/card_detail';
}

class AppRouter {
  static AppLogger logger = AppLogger();

  static Map<String, dynamic> _getArguments() {
    logger.d(Get.arguments);
    return Get.arguments ?? {};
  }

  static final routes = [
    GetPage(
      name: RoutePath.splash,
      page: () {
        return const SplashPage();
      },
    ),
    GetPage(
      name: RoutePath.cardList,
      page: () {
        final args = _getArguments();
        return CardListPage(titleCardType: args['titleCardType']);
      },
    ), GetPage(
      name: RoutePath.cardDetail,
      page: () {
        final args = _getArguments();
        return CardDetailPage(titleCardDetail: args['titleCardDetail']);
      },
    ),
  ];
}

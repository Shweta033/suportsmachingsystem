import 'package:get/get.dart';
import '../apps/bindings/home_bindings.dart';
import '../modules/home/smsReady/widgets/about_view.dart';
import '../modules/home/smsReady/widgets/colorSystem_view.dart';
import '../modules/home/smsReady/widgets/fordesign_view.dart';
import '../modules/home/smsReady/widgets/shop_view.dart';
import '../modules/home/smsReady/widgets/smsready_view.dart';
import '../modules/home/smsReady/widgets/support_view.dart';
import '../modules/home/smsReady/widgets/sustainability_view.dart';
import '../modules/home/smsReady/widgets/whatIsSms_View.dart';
import '../modules/home/views/home_views.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(name: AppRoutes.whatIsSms, page: () => const WhatIsSmsView()),
    GetPage(name: AppRoutes.colourSystem, page: () => const ColourSystemView()),
    GetPage(
      name: AppRoutes.smsReadyExpert,
      page: () => const SmsReadyExpertView(),
    ),
    GetPage(
      name: AppRoutes.designConfidence,
      page: () => const DesignConfidenceView(),
    ),
    GetPage(
      name: AppRoutes.sustainabilityView,
      page: () => const SustainabilityView(),
    ),
    GetPage(name: AppRoutes.aboutView, page: () => const AboutView()),
    GetPage(name: AppRoutes.supportView, page: () => const SupportView()),
    GetPage(name: AppRoutes.shopView, page: () => const ShopView()),
  ];
}

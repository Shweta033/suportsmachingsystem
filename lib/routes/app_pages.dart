import 'package:get/get.dart';

import '../apps/bindings/home_bindings.dart';
import '../modules/home/views/home_views.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

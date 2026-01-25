import 'package:get/get.dart';

class HomeController extends GetxController {
  final isMenuOpen = false.obs;

  void toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
  }
}

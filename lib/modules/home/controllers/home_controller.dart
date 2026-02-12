import 'package:get/get.dart';

class HomeController extends GetxController {
  final isMenuOpen = false.obs;
  final currentIndex = 0.obs;

  void toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}

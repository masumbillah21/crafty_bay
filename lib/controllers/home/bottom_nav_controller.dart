import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int _currentScreen = 0;
  int get currentScreen => _currentScreen;

  void changeScreen(int index) {
    if (_currentScreen == index) {
      return;
    }
    _currentScreen = index;
    update();
  }

  void backToHome() {
    changeScreen(0);
  }
}

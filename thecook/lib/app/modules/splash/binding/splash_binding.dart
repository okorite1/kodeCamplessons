import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // ✅ Creates immediately since view needs it right away
    Get.put<SplashController>(SplashController());
  }
}

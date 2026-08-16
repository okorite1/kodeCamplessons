import 'package:get/get.dart';
import 'package:thecook/services/storage/service_storage.dart';
import '../../../../routes/app_pages.dart';

class SplashController extends GetxController {
  // Get the storage service
  final ServiceStorage _serviceStorage = Get.find<ServiceStorage>();

  // Reactive variables for UI state (optional)
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _checkInitialRoute();
  }

  Future<void> _checkInitialRoute() async {
    try {
      isLoading.value = true;

      // Wait for 3 seconds (shows splash screen)
      await Future.delayed(const Duration(seconds: 3));

      // Check if user is new
      final bool isFirstTimeUser = _serviceStorage.getIsFirstTime();

      // Navigate based on user status
      if (isFirstTimeUser) {
        // First time → Show onboarding
        Get.offAllNamed(Routes.onboarding);
      } else {
        // Returning user → Go to home
        Get.offAllNamed(Routes.auth);
      }
    } catch (e) {
      // If something goes wrong, show error
      errorMessage.value = 'Something went wrong. Please restart the app.';
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskfive/app/data/onboarding/onboarding_items.dart';
import 'package:taskfive/routes/app_pages.dart';
import 'package:taskfive/services/storage/service_storage.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  final ServiceStorage serviceStorage = Get.find<ServiceStorage>();

  final RxInt currentPageIndex = 0.obs;

  int get totalPages => onboardingPages.length;

  // Called whenever the user swipes pages
  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  void nextPage() {
    if (currentPageIndex.value < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      completeOnboarding();
    }
  }

  void skipOnboarding() {
    completeOnboarding();
  }

  Future<void> completeOnboarding() async {
    await serviceStorage.setIsfirstTime(false);
    Get.offAllNamed(Routes.auth);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

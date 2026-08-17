import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thecook/routes/app_pages.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool obscurePassword = true.obs;
  final RxBool isLoading = false.obs;

  void togglePassword() {
    obscurePassword.toggle();
  }

  Future<void> login() async {
    // Unfocus keyboard
    FocusManager.instance.primaryFocus?.unfocus();

    // Validate form
    if (!formKey.currentState!.validate()) {
      return;
    }

    // Start loading
    isLoading.value = true;

    // Simulate API call (replace with actual API)
    await Future.delayed(const Duration(seconds: 2));

    // Stop loading
    isLoading.value = false;

    // Navigate to home
    Get.offAllNamed(Routes.home);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

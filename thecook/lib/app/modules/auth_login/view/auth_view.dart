import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import 'package:thecook/app/modules/auth_login/app_validator/appvalidators.dart';
import 'package:thecook/app/modules/auth_login/app_validator/customtextfield.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo / Title
                Icon(Icons.restaurant, size: 80, color: Colors.blue.shade700),
                const SizedBox(height: 16),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Login to continue',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 40),

                // Email Field (Using CustomTextField)
                CustomTextField(
                  controller: controller.emailController,
                  label: "Email",
                  icon: Icons.email,
                  validator: AppValidators.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  hintText: '',
                  obscureText: false,
                ),
                const SizedBox(height: 16),

                // Password Field (Using CustomTextField with Obx)
                Obx(
                  () => CustomTextField(
                    controller: controller.passwordController,
                    label: "Password",
                    icon: Icons.lock,
                    validator: AppValidators.validatePassword,
                    obscureText: controller.obscurePassword.value,
                    hintText: '',
                    suffixIcon: IconButton(
                      onPressed: controller.togglePassword,
                      icon: Icon(
                        controller.obscurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('don\'t have an account?'),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/register');
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.teal[800]),
                      ),
                    ),
                  ],
                ),
                // Login Button
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

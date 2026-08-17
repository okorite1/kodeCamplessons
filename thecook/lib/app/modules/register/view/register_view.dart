import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thecook/app/modules/auth_login/app_validator/appvalidators.dart';
import 'package:thecook/app/modules/auth_login/app_validator/customtextfield.dart';
import 'package:thecook/app/modules/register/controller/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 197, 201),

      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          'Register',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),

                // Logo
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.teal,
                  child: ClipOval(
                    child: Image.network(
                      'https://static.vecteezy.com/system/resources/thumbnails/052/793/073/small/chef-logo-design-vector.jpg',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.restaurant,
                          color: Colors.white,
                          size: 35,
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Please fill in your details',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade700,
                  ),
                ),

                const SizedBox(height: 30),

                // Full Name
                CustomTextField(
                  label: 'NAME',
                  hintText: 'Enter your full name',
                  controller: controller.fullnameController,
                  obscureText: false,
                  validator: AppValidators.validateName,
                  keyboardType: TextInputType.name,
                ),

                const SizedBox(height: 12),

                // Email
                CustomTextField(
                  label: 'EMAIL',
                  hintText: 'Enter your email',
                  controller: controller.emailController,
                  obscureText: false,
                  validator: AppValidators.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 12),

                // Phone
                CustomTextField(
                  label: 'PHONE NO.',
                  hintText: 'Enter your phone number',
                  controller: controller.phoneNumberController,
                  obscureText: false,
                  validator: AppValidators.validatePhone,
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 12),

                // Password
                Obx(
                  () => CustomTextField(
                    label: 'PASSWORD',
                    hintText: 'Enter your password',
                    controller: controller.passwordController,
                    obscureText: controller.obscurePassword.value,
                    validator: AppValidators.validatePassword,
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

                const SizedBox(height: 12),

                // Confirm Password
                Obx(
                  () => CustomTextField(
                    label: 'CONFIRM PASSWORD',
                    hintText: 'Re-enter your password',
                    controller: controller.confirmPasswordController,
                    obscureText: controller.obscureConfirmPassword.value,
                    validator: (value) {
                      return AppValidators.validateConfirmPassword(
                        value,
                        controller.passwordController.text,
                      );
                    },
                    suffixIcon: IconButton(
                      onPressed: controller.toggleConfirmPassword,
                      icon: Icon(
                        controller.obscureConfirmPassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Birth Date
                CustomTextField(
                  label: 'BIRTH DATE',
                  hintText: 'Enter your birth date',
                  controller: controller.birthdateController,
                  obscureText: false,
                  keyboardType: TextInputType.datetime,
                ),

                const SizedBox(height: 40),

                // Register Button
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
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
                              'Register',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Go back to login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.teal.shade800,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

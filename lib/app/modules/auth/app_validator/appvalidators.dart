import 'package:get/get.dart';

class AppValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    if (!GetUtils.isEmail(value.trim())) {
      return "Enter a valid email";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Include one uppercase letter";
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Include one number";
    }

    return null;
  }
}

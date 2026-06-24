class AppValidators {
  String? validateEmailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter email or phone number';
    }

    // Email
    if (value.contains('@') && value.contains('.') && value.length >= 5) {
      return null;
    }

    // Phone
    if (value.length >= 10 && value.length <= 11) {
      return null;
    }

    return 'Enter a valid email or phone number';
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^[0-9]{11}$').hasMatch(value)) {
      return 'Enter a valid 11-digit phone number';
    }
    return null;
  }
}

// CREATE THE GLOBAL INSTANCE
final validators = AppValidators();

// WRAPPER GETTERS - These expose the methods as simple functions
String? Function(String?) get validateEmail => validators.validateEmail;
String? Function(String?) get validatePassword => validators.validatePassword;
String? Function(String?) get validatePhone => validators.validatePhone;
String? Function(String?) get validateemailorPhone =>
    validators.validateEmailOrPhone;

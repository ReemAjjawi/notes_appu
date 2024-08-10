String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  RegExp passwordRegExp =
      RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  if (!passwordRegExp.hasMatch(value)) {
    return 'Password must be at least 8 characters long, include an uppercase letter, a number, and a special character';
  }
  return null;
}

String? confirmPasswordValidator(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}

String? phoneNumberValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Please enter your mobile number';
  }
  if (!RegExp(r'^\d{10}$').hasMatch(phone)) {
    return 'Mobile number must be exactly 10 digits';
  }
  return null;
}

String? stringValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter this box';
  }
  return null;
}

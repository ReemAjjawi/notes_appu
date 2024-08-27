class ServerException implements Exception {}

class ValidationException implements Exception {}

class PasswordException implements ValidationException {
  String message;
  PasswordException(this.message);
}

class PhoneException implements ValidationException {
  String? message;
  PhoneException(this.message);
}

class UsernameException implements ValidationException {
  String? message;
  UsernameException(this.message);
}

class PasswordMustContainOneUppercase implements Exception {
  String? message;
  PasswordMustContainOneUppercase(this.message);
}

class EmptyException implements Exception {
  String message;
  EmptyException(this.message);
}

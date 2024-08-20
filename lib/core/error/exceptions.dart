

 class ServerException implements Exception {}

class ValidationException  implements Exception {}
class PasswordExcetion implements ValidationException {
  String message ;
  PasswordExcetion (this.message){}
}
class UserNameExcetion implements ValidationException {
    String message ;
  UserNameExcetion (this.message){}
}
class PasswordMustContainOneUppercase implements Exception{
  String message ;
  PasswordMustContainOneUppercase (this.message){}
}
abstract class Failures {}

 class ServerFailure extends Failures {}
 class ValidationFailure extends Failures {}
  class InternetFailure extends Failures {}


class OfflineFailure extends Failures {}

class EmptyCacheFailure extends Failures {}
class PasswordFailure implements ValidationFailure {
  String message ;
  PasswordFailure (this.message){}
}
class UserNameFailure implements ValidationFailure {
    String? message ;
  UserNameFailure (this.message){}
}
class ConnectionFailure extends Failures {}
class EmptyFailure implements Failures {
  String message;
  EmptyFailure(this.message) {}

}
class PhoneFailure implements Failures {
  String? message;
  PhoneFailure(this.message) {}

}
abstract class Failures {}

 class ServerFailure extends Failures {}

class OfflineFailure extends Failures {}

class EmptyCacheFailure extends Failures {}
class PasswordFailure implements ServerFailure {
  String message ;
  PasswordFailure (this.message){}
}
class UserNameFailure implements ServerFailure {
    String message ;
  UserNameFailure (this.message){}
}
class ConnectionFailure extends Failures {}

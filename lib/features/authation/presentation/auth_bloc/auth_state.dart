part of 'auth_bloc.dart';

@immutable
sealed class RegisterClassState {}

final class InitialState extends RegisterClassState {}

class RegisterSuccessState extends RegisterClassState {

}
class LoadingState extends RegisterClassState {}

class FailureState extends RegisterClassState {
   final String? message;

   FailureState({required this.message});
}


class FailurePhoneState extends RegisterClassState {
   final String? message;

   FailurePhoneState({required this.message});

}


class FailureUsernameState extends RegisterClassState {
   final String? message;

   FailureUsernameState({required this.message});


}

// class UsernameFailureState extends RegisterClassState {
//   final String message;

//   UsernameFailureState({required this.message});
// }

// class PasswordFailureState extends RegisterClassState {
//   final String message;

//   PasswordFailureState({required this.message});
// }

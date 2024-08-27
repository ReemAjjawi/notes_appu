part of 'login_bloc.dart';

@immutable
sealed class LogInClassState {}

final class InitialStateLogIn extends LogInClassState {}

class LogInSuccessState extends LogInClassState {

}
class LogInLoadingState extends LogInClassState {}

class LogInFailureState extends LogInClassState {
   final String message;

   LogInFailureState({required this.message});


}



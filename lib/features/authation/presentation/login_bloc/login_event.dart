// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
sealed class LogInClassEvent {}

class LogInEvent extends LogInClassEvent {
  LogInModel user;
 LogInEvent(
     this.user,
  );
}

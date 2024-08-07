// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class RegisterClassEvent {}

class RegisterEvent extends RegisterClassEvent {
  UserModel user;
  RegisterEvent(
     this.user,
  );
}

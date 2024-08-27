// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'changepassword_bloc.dart';

@immutable
sealed class changepasswordClassEvent {}

class changepasswordEvent extends changepasswordClassEvent {
  changepasswordModel pass;
  changepasswordEvent(
    this.pass,
  );
}

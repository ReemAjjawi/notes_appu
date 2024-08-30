// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'changepassword_bloc.dart';

@immutable
sealed class changepasswordClassState {}

final class InitialStatechangepassword extends changepasswordClassState {}

class SuccessStatechangepassword extends changepasswordClassState {}

class LoadingStatechangepassword extends changepasswordClassState {}

class FailureStatechangepassword extends changepasswordClassState {
  final String message;

  FailureStatechangepassword({required this.message});
}


class internetStatechangepassword extends changepasswordClassState {
  final String message;

  internetStatechangepassword ({required this.message});
}

class unknowStatechangepassword extends changepasswordClassState {
  final String message;

  unknowStatechangepassword({required this.message});
}

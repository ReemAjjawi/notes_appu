// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'putpolicy_bloc.dart';

@immutable
sealed class putpolicyClassState {}

final class InitialStatepolicyput extends putpolicyClassState {}

class SuccessStatepolicyput extends putpolicyClassState {}

class LoadingStatepolicyput extends putpolicyClassState {}

class FailureStatepolicyput extends putpolicyClassState {
  final String message;

  FailureStatepolicyput({required this.message});
}

class internetStatepolicyput extends putpolicyClassState {
  final String message;

  internetStatepolicyput({required this.message});
}

class unknowStatepolicyput extends putpolicyClassState {
  final String message;

  unknowStatepolicyput({required this.message});
}

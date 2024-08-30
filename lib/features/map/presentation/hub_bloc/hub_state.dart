// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hub_bloc.dart';

@immutable
sealed class HubClassState {}

final class InitialStatehub extends HubClassState {}

class HubSuccessState extends HubClassState {
  final DataSuccessList<HubinfoModel> data;
  HubSuccessState({
    required this.data,
  });
}
class EmptyFailureStamap extends HubClassState {
  final String message;

  EmptyFailureStamap({required this.message});
}
class LoadingStatehub extends HubClassState {}

class FailureStatehub extends HubClassState {
  final String message;

  FailureStatehub({required this.message});
}

class internetStateh extends HubClassState {
  final String message;
  internetStateh({required this.message});
}

class unknowStateh extends HubClassState {
  final String message;

  unknowStateh({required this.message});
}

// class UsernameFailureState extends RegisterClassState {
//   final String message;

//   UsernameFailureState({required this.message});
// }

// class PasswordFailureState extends RegisterClassState {
//   final String message;

//   PasswordFailureState({required this.message});
// }

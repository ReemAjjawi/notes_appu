part of 'articles_bloc.dart';

@immutable
sealed class RegisterClassState {}

final class InitialState extends RegisterClassState {}

class SuccessState extends RegisterClassState {

}

class LoadingState extends RegisterClassState {}

class FailureState extends RegisterClassState {
  final String message;

  FailureState({required this.message});
}

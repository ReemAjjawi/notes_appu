// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'policy_bloc.dart';

@immutable
sealed class policyClassState {}

final class InitialStatepolicy extends policyClassState {}

class SuccessStatepolicy extends policyClassState {
  final DataSuccessObject<policyModel> data;
  SuccessStatepolicy({
    required this.data,
  });
}

class LoadingStatepolicy extends policyClassState {}

class FailureStatepolicy extends policyClassState {
  final String message;

  FailureStatepolicy({required this.message});
}

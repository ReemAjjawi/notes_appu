// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import '../../../data/model/response_model.dart';
@immutable
sealed class AddMoneyClassState {}

class SuccessState extends AddMoneyClassState {
  BalanceModel model;
  SuccessState({
    required this.model,
  });
}

class InitialState extends AddMoneyClassState {}

class LoadingState extends AddMoneyClassState {}

class FailureState extends AddMoneyClassState {
  final String message;

  FailureState({required this.message});
}

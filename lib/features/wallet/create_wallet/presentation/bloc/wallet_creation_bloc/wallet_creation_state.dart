// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

@immutable
sealed class WalletCreationClassState {}

class SuccessState extends WalletCreationClassState {

}
class InitialState extends WalletCreationClassState {

}

class LoadingState extends WalletCreationClassState {}

class FailureState extends WalletCreationClassState {
  final String message;

  FailureState({required this.message});
}


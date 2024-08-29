// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:ride_application/core/success/success.dart';
import 'package:ride_application/features/hub_content/data/model/second_model.dart';

@immutable
sealed class HubContentsClassState {}

class Success extends HubContentsClassState {
  final DataSuccessList<BicycleListModel> bicycles;
  Success({
    required this.bicycles,
  });
}

class LoadingState extends HubContentsClassState {}

class FailureState extends HubContentsClassState {
  final String message;

  FailureState({required this.message});
}

class EmptyFailureState extends HubContentsClassState {
  final String message;

  EmptyFailureState({required this.message});
}


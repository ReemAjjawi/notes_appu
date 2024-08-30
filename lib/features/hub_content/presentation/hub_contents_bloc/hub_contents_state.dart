// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:ride_application/core/success/success.dart';
import 'package:ride_application/features/hub_content/data/model/second_model.dart';

@immutable
sealed class HubContentsClassState {}

class Successhub extends HubContentsClassState {
  final DataSuccessList<BicycleListModel> bicycles;
  Successhub({
    required this.bicycles,
  });
}

class LoadingStatehub extends HubContentsClassState {}

class FailureStatehub extends HubContentsClassState {
  final String message;

  FailureStatehub({required this.message});
}

class EmptyFailureState extends HubContentsClassState {
  final String message;

  EmptyFailureState({required this.message});
}

class InternetStatehub extends HubContentsClassState {
  final String message;

  InternetStatehub({required this.message});
}

class UnknowStatehub extends HubContentsClassState {
  final String message;

  UnknowStatehub({required this.message});
}

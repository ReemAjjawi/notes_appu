// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import '../../../../core/success/success.dart';
import '../../domain/entity/bicycle_entity.dart';

@immutable
sealed class BicyclesClassState {}

class Success extends BicyclesClassState {
  final DataSuccessList<BicycleEntity> bicycles;
  Success({
    required this.bicycles,
  });
}

class LoadingState extends BicyclesClassState {}

class FailureState extends BicyclesClassState {
  final String message;

  FailureState({required this.message});
}

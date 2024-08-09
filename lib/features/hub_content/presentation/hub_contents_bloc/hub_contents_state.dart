// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:ride_application/features/hub_content/data/model/second_model.dart';


@immutable
sealed class HubContentsClassState {}

final class InitialState extends HubContentsClassState {}


class Success extends HubContentsClassState {
  final List<BicycleListModel> bicycles;
  Success({
    required this.bicycles,
  });

}
class LoadingState extends HubContentsClassState {}

class FailureState extends HubContentsClassState {
   final String message;

   FailureState({required this.message});


}

// class UsernameFailureState extends RegisterClassState {
//   final String message;

//   UsernameFailureState({required this.message});
// }

// class PasswordFailureState extends RegisterClassState {
//   final String message;

//   PasswordFailureState({required this.message});
// }

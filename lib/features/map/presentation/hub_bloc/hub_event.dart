// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hub_bloc.dart';

@immutable
sealed class HubClassEvent {}

class HubEvent extends HubClassEvent {
  HubModel hub;
  HubEvent(
    this.hub,
  );
}

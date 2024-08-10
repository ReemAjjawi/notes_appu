// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'Reservation_bloc.dart';

@immutable
sealed class ReservationClassEvent {}

class ReservationEvent extends ReservationClassEvent {
  ReservationModel reservation;
  ReservationEvent(
    this.reservation,
  );
}

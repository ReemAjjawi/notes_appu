part of 'Reservation_bloc.dart';

@immutable
sealed class ReservationClassState {}

final class InitialState extends ReservationClassState {}

class ReservationSuccessState extends ReservationClassState {

}
class LoadingStateReservation extends ReservationClassState {}

class FailureStateReservation extends ReservationClassState {
   final String message;

   FailureStateReservation({required this.message});


}

// class UsernameFailureState extends RegisterClassState {
//   final String message;

//   UsernameFailureState({required this.message});
// }

// class PasswordFailureState extends RegisterClassState {
//   final String message;

//   PasswordFailureState({required this.message});
// }

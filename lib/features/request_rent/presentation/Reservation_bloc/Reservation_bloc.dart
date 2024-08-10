import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:ride_application/features/request_rent/data/model/reservation_model.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecase/register_use_case.dart';

part 'Reservation_event.dart';
part 'Reservation_state.dart';

class ReservationBloc
    extends Bloc<ReservationClassEvent, ReservationClassState> {
  final ReservationUseCase reservationUseCase;
  ReservationBloc(this.reservationUseCase) : super(InitialState()) {
    on<ReservationEvent>((event, emit) async {
      emit(LoadingStateReservation());
      final failureOrEntity = await reservationUseCase.call(event.reservation);

      failureOrEntity.fold((failure) {
        String message = '';
        switch (failure.runtimeType) {
          //  case PasswordFailure():
// emit(FailurePasswordState(message: message));
          //       break;
//case UserNameFailure()
// emit(FailureusernameState(message: message));
          //       break;
          case ServerFailure():
            message = "please try again";
            emit(FailureStateReservation(message: message));
            break;
        }
      }, (success) {
        emit(
          ReservationSuccessState(),
        );
      });
    });
  }
}

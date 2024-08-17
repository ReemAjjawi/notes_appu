import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:ride_application/core/error/failures.dart';
import 'package:ride_application/features/authation/data/model/login_model.dart';
import 'package:ride_application/features/authation/domain/usecase/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LogInBloc extends Bloc<LogInClassEvent, LogInClassState> {
  final LogInUseCase loginUseCase;
  LogInBloc(this.loginUseCase) : super(InitialStateLogIn()) {
    on<LogInEvent>((event, emit) async {
      emit(LogInLoadingState());
      final failureOrEntity = await loginUseCase.call(event.user);

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
            emit(LogInFailureState(message: message));
            break;
        }
      }, (success) {
        emit(
          LogInSuccessState(),
        );
      });
    });
  }
}

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:ride_application/features/authation/data/model/user_model.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecase/register_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<RegisterClassEvent, RegisterClassState> {
  final RegisterUseCase signUpUseCase;

  AuthBloc(this.signUpUseCase) : super(InitialState()) {
    on<RegisterEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrEntity = await signUpUseCase.call(event.user);

      failureOrEntity.fold((failure) {
        String? message = '';
        switch (failure.runtimeType) {
          // case PasswordFailure:
          //   message = (failure as PasswordFailure).message;
          //   emit(FailurePasswordState(message: message));
          //   break;
          case UserNameFailure:
            message = (failure as UserNameFailure).message;
            emit(FailureUsernameState(message: message));
            break;
          case PhoneFailure:
            message = (failure as PhoneFailure).message;
            emit(FailurePhoneState(message: message));
            break;
          case ServerFailure:
            message = "Please try again ...";
            emit(FailureState(message: message));
            break;

          case InternetFailure:
            message = "no internet ...";
            print(message);
            emit(internetPhoneState(message: message));
            break;

          default:
            message = "An unknown error occurred.";
            emit(FailureState(message: message));
        }
      }, (success) {
        emit(RegisterSuccessState());
      });
    });
  }
}

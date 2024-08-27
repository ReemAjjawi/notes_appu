import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/changepasswordModel.dart';
import '../../domain/usecase/changepassword_use_case.dart';

part 'changepassword_event.dart';
part 'changepassword_state.dart';

class changepasswordBloc
    extends Bloc<changepasswordClassEvent, changepasswordClassState> {
  final changepasswordUseCase changepassworUseCase;
  changepasswordBloc(this.changepassworUseCase)
      : super(InitialStatechangepassword()) {
    on<changepasswordEvent>((event, emit) async {
      emit(LoadingStatechangepassword());
      final failureOrEntity = await changepassworUseCase.call(event.pass);

      failureOrEntity.fold((failure) {
        String message = 'An unknown error occurred';
        switch (failure.runtimeType) {
          case PasswordFailure:
            message = "You must provide a valid password";
            break;
          case UserNameFailure:
            message = "You must change the username";
            break;
          case ServerFailure:
            message = "Please try again later";
            break;
        }
        emit(FailureStatechangepassword(message: message));
      }, (data) {
        print("cccccccccccccccccccccccccccccc");

        emit(SuccessStatechangepassword());
      });
    });
  }
}

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
          case ServerFailure():
            message = "please try again";
            emit(FailureStatechangepassword(message: message));
            break;

          case InternetFailure:
            message = "no internet ...";
            print(message);
            emit(internetStatechangepassword(message: message));

          default:
            message = "An unknown error occurred.";
            emit(unknowStatechangepassword(message: message));
        }
        emit(FailureStatechangepassword(message: message));
      }, (data) {
        print("cccccccccccccccccccccccccccccc");

        emit(SuccessStatechangepassword());
      });
    });
  }
}

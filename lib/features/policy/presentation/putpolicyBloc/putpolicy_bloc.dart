import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/policy_model.dart';
import '../../domain/usecase/putpolicy_use_case.dart';

part 'putpolicy_event.dart';
part 'putpolicy_state.dart';

class putpolicyBloc extends Bloc<putpolicyClassEvent, putpolicyClassState> {
  final putpolicyUseCase policUseCase;
  putpolicyBloc(this.policUseCase) : super(InitialStatepolicyput()) {
    on<putpolicyEvent>((event, emit) async {
      emit(LoadingStatepolicyput());
      final failureOrEntity = await policUseCase.call(event.pass);

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
        emit(FailureStatepolicyput(message: message));
      }, (data) {
        print("cccccccccccccccccccccccccccccc");

        emit(SuccessStatepolicyput());
      });
    });
  }
}

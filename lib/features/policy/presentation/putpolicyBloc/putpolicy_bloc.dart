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
          case ServerFailure():
            message = "please try again";
            emit(FailureStatepolicyput(message: message));
            break;

          case InternetFailure:
            message = "no internet ...";
            print(message);
            emit(internetStatepolicyput(message: message));

          default:
            message = "An unknown error occurred.";
            emit(unknowStatepolicyput(message: message));
        }
        emit(FailureStatepolicyput(message: message));
      }, (data) {
        print("cccccccccccccccccccccccccccccc");

        emit(SuccessStatepolicyput());
      });
    });
  }
}

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:ride_application/features/policy/data/model/policy_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../domain/usecase/getpolicy_use_case.dart';

part 'policy_event.dart';
part 'policy_state.dart';

class policyBloc extends Bloc<policyClassEvent, policyClassState> {
  final policyUseCase policUseCase;
  policyBloc(this.policUseCase) : super(InitialStatepolicy()) {
    on<policyEvent>((event, emit) async {
      emit(LoadingStatepolicy());
      final failureOrEntity = await policUseCase.call();

      failureOrEntity.fold((failure) {
        String message = 'An unknown error occurred';
        switch (failure.runtimeType) {
          case ServerFailure:
            message = "Please try again later";
            break;
        }
        emit(FailureStatepolicy(message: message));
      }, (success) {
        if (success is DataSuccessObject<policyModel>) {
          print("Success with data: ${success.data}");
          emit(SuccessStatepolicy(data: success));
        }
      });
    });
  }
}

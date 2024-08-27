import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/core/success/success.dart';
import 'package:ride_application/features/categories/data/model/bicycle_model.dart';
import 'package:ride_application/features/categories/presentation/bicycle_bloc/bicycle_event.dart';
import 'package:ride_application/features/categories/presentation/bicycle_bloc/bicycle_state.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecase/bicycle_use_case.dart';

class BicycleBloc extends Bloc<BicyclesClassEvent, BicyclesClassState> {
  final BicycleUseCase bicycleUseCase;
  BicycleBloc(this.bicycleUseCase) : super(LoadingState()) {
    on<GetBicycleEvent>((event, emit) async {
      // emit(LoadingState());
      final failureOrEntity = await bicycleUseCase.call(event.categoryName);

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
            emit(FailureState(message: message));
            break;
        }
      }, (success) {
        if (success is DataSuccessList<BicycleModel>) {
          print("Success with data: ${success.data}");
          emit(Success(bicycles: success));
        }
      });
    });
  }
}

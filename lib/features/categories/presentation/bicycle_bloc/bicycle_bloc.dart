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
          case ServerFailure():
            message = "please try again";
            print(message);
            emit(FailureState(message: message));
            break;

          case InternetFailure:
            message = "no internet ...";
            print(message);
            emit(internetState(message: message));

          default:
            message = "An unknown error occurred.";
            print(message);

            emit(FailureState(message: message));
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

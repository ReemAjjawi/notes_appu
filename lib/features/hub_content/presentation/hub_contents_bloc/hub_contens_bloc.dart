import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/core/success/success.dart';
import '../../../../core/error/failures.dart';
import '../../data/model/second_model.dart';
import '../../domain/usecase/get_hub_contents__use_case.dart';
import 'hub_contents_event.dart';
import 'hub_contents_state.dart';

class HubContentsBloc
    extends Bloc<HubContentsClassEvent, HubContentsClassState> {
  final GetHubContentsUseCase getHubContentsUseCase;
  HubContentsBloc(this.getHubContentsUseCase) : super(LoadingState()) {
    on<GetHubContentsEvent>((event, emit) async {
      //     emit(LoadingState());
      final failureOrEntity =
          await getHubContentsUseCase.call(event.hubId, event.categoryName);

      failureOrEntity.fold((failure) {
        String message = '';
        switch (failure.runtimeType) {
          case ServerFailure():
            message = "please try again";
            log("-------------------------------------");
            print(failure.runtimeType);
            print("iam in switch hub content bloc ");
            emit(FailureState(message: message));
            break;
          case EmptyFailure():
            message = (failure as EmptyFailure).message;
            emit(EmptyFailureState(message: message));
            break;
        }
      }, (success) {
        if (success is DataSuccessList<BicycleListModel>) {
          print("Success with data: ${success.data}");
          emit(Success(bicycles: success));
        }
      });
    });
  }
}

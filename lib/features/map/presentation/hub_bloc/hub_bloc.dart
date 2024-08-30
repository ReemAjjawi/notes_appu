import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../data/model/hub_model.dart';
import '../../data/model/hubinfo_model.dart';
import '../../domain/usecase/register_use_case.dart';

part 'hub_event.dart';
part 'hub_state.dart';

class HubBloc extends Bloc<HubClassEvent, HubClassState> {
  final HubUseCase hubUseCase;
  HubBloc(this.hubUseCase) : super(InitialStatehub()) {
    on<HubEvent>((event, emit) async {
      emit(LoadingStatehub());
      final failureOrEntity = await hubUseCase.call(event.hub);

      failureOrEntity.fold((failure) {
        String message = 'An unknown error occurred';
        switch (failure.runtimeType) {
          case ServerFailure:
            message = "Please try again later";
            print(message);
            emit(FailureStatehub(message: message));

            break;

          case InternetFailure:
            message = "no internet ...";
            print(message);
            emit(internetStateh(message: message));

          default:
            message = "An unknown error occurred.";
            print(message);

            emit(unknowStateh(message: message));
        }
      }, (success) {
        if (success is DataSuccessList<HubinfoModel>) {
          print("Success with data: ${success.data}");
          emit(HubSuccessState(data: success));
        }
      });
    });
  }
}

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
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
        emit(FailureStatehub(message: message));
      }, (data) {
        print("cccccccccccccccccccccccccccccc");
        
        emit(HubSuccessState(data: data));
      });
    });
  }
}

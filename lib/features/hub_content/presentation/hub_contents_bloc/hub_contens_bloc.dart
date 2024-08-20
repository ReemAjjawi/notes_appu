
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../domain/usecase/get_hub_contents__use_case.dart';
import 'hub_contents_event.dart';
import 'hub_contents_state.dart';

class HubContentsBloc extends Bloc<HubContentsClassEvent,HubContentsClassState> {
  final GetHubContentsUseCase getHubContentsUseCase;
  HubContentsBloc(this.getHubContentsUseCase) : super(LoadingState()) {
    on<GetHubContentsEvent>((event, emit) async {
 //     emit(LoadingState());
      final failureOrEntity = await getHubContentsUseCase.call(event.hubId,event.categoryName);

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
    message="please try again";
       emit(FailureState(message: message));
       break;
        }
     
      }, (bicycles) {
        emit(
          Success(bicycles:bicycles ),
        );
      });
    });
  }
}

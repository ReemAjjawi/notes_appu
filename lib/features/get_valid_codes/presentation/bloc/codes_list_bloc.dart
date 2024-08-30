import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../domain/usecase/wallet_info_use_case.dart';
import 'codes_list_event.dart';
import 'codes_list_state.dart';

class CodesListBloc
    extends Bloc<CodesListClassEvent, CodesListClassState> {
  final WalletInfoUseCase walletInfoUseCase;
  CodesListBloc(this.walletInfoUseCase) : super(LoadingStateCodesList()) {
    on<CodesListEvent>((event, emit) async {
      final failureOrEntity = await walletInfoUseCase.call();
      print("iam in bloc ");
    
      failureOrEntity.fold((failure) {
        String message = '';
        switch (failure.runtimeType) {
          case ServerFailure():
            message = "please try again";
            emit(FailureStateCodesList(message: message));
            break;
        }
      }, (codesInfo) {
        emit(
          SuccessStateCodesList(codesInfo:codesInfo),
        );
      });
    });
  }
}

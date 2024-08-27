import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../domain/usecase/wallet_info_use_case.dart';
import 'wallet_info_event.dart';
import 'wallet_info_state.dart';

class WalletInfoBloc
    extends Bloc<WalletInfoClassEvent, WalletInfoClassState> {
  final WalletInfoUseCase walletInfoUseCase;
  WalletInfoBloc(this.walletInfoUseCase) : super(LoadingState()) {
    on<WalletInfoEvent>((event, emit) async {
      final failureOrEntity = await walletInfoUseCase.call();
      print("iam in bloc ");
    
      failureOrEntity.fold((failure) {
        String message = '';
        switch (failure.runtimeType) {
          case ServerFailure():
            message = "please try again";
            emit(FailureState(message: message));
            break;
        }
      }, (walletInfo) {
        emit(
          SuccessState(walletInfo:walletInfo),
        );
      });
    });
  }
}

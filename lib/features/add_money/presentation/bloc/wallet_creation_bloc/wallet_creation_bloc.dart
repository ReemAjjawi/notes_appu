import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../wallet/domain/usecase/wallet_creation_use_case.dart';
import '../../../domain/usecase/wallet_creation_use_case.dart';
import 'wallet_creation_event.dart';
import 'wallet_creation_state.dart';

class WalletCreationBloc
    extends Bloc<WalletCreationClassEvent, WalletCreationClassState> {
  final WalletCreationUseCase walletCreationUseCase;
  WalletCreationBloc(this.walletCreationUseCase) : super(LoadingState()) {
    on<WalletCreationEvent>((event, emit) async {
      final failureOrEntity = await walletCreationUseCase.call(event.wallet);
      print("iam in bloc ");
      print(event.wallet);
      failureOrEntity.fold((failure) {
        String message = '';
        switch (failure.runtimeType) {
          case ServerFailure():
            message = "please try again";
            emit(FailureState(message: message));
            break;
        }
      }, (successSituation) {
        emit(
          Success(),
        );
      });
    });
  }
}

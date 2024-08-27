
import '../../data/model/wallet_info_model.dart';

sealed class WalletInfoClassState {}

class SuccessState extends WalletInfoClassState {
  WalletInfo walletInfo;
  SuccessState({
    required this.walletInfo,
  });
}

class LoadingState extends WalletInfoClassState {}

class FailureState extends WalletInfoClassState {
  final String message;

  FailureState({required this.message});
}

// ignore_for_file: public_member_api_docs, sort_constructors_first


import '../../../data/model/wallet_model.dart';

sealed class WalletCreationClassEvent {}

class WalletCreationEvent extends WalletCreationClassEvent {
Wallet wallet;
  WalletCreationEvent({
    required this.wallet,
  });

 


}

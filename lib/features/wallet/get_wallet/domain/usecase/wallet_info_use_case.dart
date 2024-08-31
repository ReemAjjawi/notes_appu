// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/model/wallet_info_model.dart';
import '../../data/repository/wallet_creation_repository_impl.dart';


class WalletInfoUseCase {
  WalletInfoRepoImp walletInfoRepoImp;
  WalletInfoUseCase({
    required this.walletInfoRepoImp,
  });

   Future<Either<Failures, WalletInfo>> call() async {
    return await walletInfoRepoImp.getWalletInfo();
  }
}

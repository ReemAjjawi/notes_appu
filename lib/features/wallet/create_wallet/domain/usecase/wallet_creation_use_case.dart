// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/success/success.dart';
import '../../data/repository/wallet_creation_repository_impl.dart';


class WalletCreationUseCase {
  WalletCreationRepoImpl walletCreationRepoImp;
  WalletCreationUseCase({
    required this.walletCreationRepoImp,
  });

   Future<Either<Failures, SuccessSituation>> call(params) async {
    return await walletCreationRepoImp.createWallet(params);
  }
}

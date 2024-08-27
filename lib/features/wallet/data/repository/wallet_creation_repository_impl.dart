import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

import '../../domain/repository/wallet_creation_repository.dart';
import '../datasource/remote/create_wallet_service.dart';
import '../model/wallet_model.dart';


class WalletCreationRepoImpl implements WalletCreationRepo {
  WalletCreationServiceImp walletCreationServiceImp;
  WalletCreationRepoImpl({required this.walletCreationServiceImp});
  @override
   Future<Either<Failures, SuccessSituation>> createWallet(Wallet wallet) async {
    log('==========================================================');
    try {
            SuccessSituation walletCreation = await walletCreationServiceImp.createWallet(wallet);
        return Right(walletCreation);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

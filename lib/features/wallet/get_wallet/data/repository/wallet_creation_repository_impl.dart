import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';

import '../../domain/repository/wallet_info_repository.dart';
import '../datasource/remote/get_wallet_service.dart';
import '../model/wallet_info_model.dart';

class WalletInfoRepoImp implements WalletInfoRepo {
  WalletInfoServiceImp walletInfoServiceImp;
  WalletInfoRepoImp({required this.walletInfoServiceImp});
  @override
   Future<Either<Failures, WalletInfo>> getWalletInfo() async {
    log('==========================================================');
    try {
             WalletInfo walletInfo = await walletInfoServiceImp.getWalletInfo();
        return Right(walletInfo);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

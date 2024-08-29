import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repository/wallet_creation_repository.dart';
import '../datasource/remote/create_wallet_service.dart';
import '../model/wallet_model.dart';


class AddMoneyRepoImpl implements AddMoneyRepo {
  AddMoneyServiceImp addMoneyServiceImp;
  AddMoneyRepoImpl({required this.addMoneyServiceImp});
  @override
   Future<Either<Failures, SuccessSituation>>  addCode(Code codeModel) async {
    log('==========================================================');
    try {
            SuccessSituation addedCode = await addMoneyServiceImp.addCode(codeModel);
        return Right(addedCode);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

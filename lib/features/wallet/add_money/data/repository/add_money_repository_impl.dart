import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../domain/repository/add_money_repository.dart';
import '../datasource/remote/add_money_service.dart';
import '../model/code_model.dart';
import '../model/response_model.dart';


class AddMoneyRepoImpl implements AddMoneyRepo {
  AddMoneyServiceImp addMoneyServiceImp;
  AddMoneyRepoImpl({required this.addMoneyServiceImp});
  @override
   Future<Either<Failures, DataSuccessObject<BalanceModel>>>  addCode(String code) async {
    log('==========================================================');
    try {
           DataSuccessObject<BalanceModel> addedCode = await addMoneyServiceImp.addCode(code);
        return Right(addedCode);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';

import '../../domain/repository/wallet_info_repository.dart';
import '../datasource/remote/get_wallet_service.dart';
import '../model/wallet_info_model.dart';

class CodeInfoRepoImp implements CodeInfoRepo {
  CodeInfoServiceImp codeInfoServiceImp;
  CodeInfoRepoImp({required this.codeInfoServiceImp});
  @override
   Future<Either<Failures, List<CodeInfo>>> getValidCodes() async {
    log('==========================================================');
    try {
             List<CodeInfo> validCodes = await codeInfoServiceImp.getValidCodes();
        return Right(validCodes);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

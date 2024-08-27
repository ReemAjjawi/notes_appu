import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../domain/repository/register_repository.dart';
import '../datasource/remote/policy_service.dart';
import '../model/policy_model.dart';

class policyRepoImpl implements policyRepo {
  final policyServiceImp policServiceImp;

  policyRepoImpl({
    required this.policServiceImp,
  });

  @override
  Future<Either<Failures, SuccessSituation>> Getpolicy() async {
    try {
      final data = await policServiceImp.getPolicy();
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures, SuccessSituation>> Putpolicy(
      policyModel polic) async {
    try {
      final data = await policServiceImp.putPolicy(polic);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    } 
  }
}

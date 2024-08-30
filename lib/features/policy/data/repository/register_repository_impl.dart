import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_connection.dart';
import '../../../../core/success/success.dart';
import '../../domain/repository/register_repository.dart';
import '../datasource/remote/policy_service.dart';
import '../model/policy_model.dart';

class policyRepoImpl implements policyRepo {
  final policyServiceImp policServiceImp;
  final NetworkConnection networkConnection;

  policyRepoImpl({
    required this.policServiceImp,
    required this.networkConnection,
  });

  @override
  Future<Either<Failures, SuccessSituation>> Getpolicy() async {
    if (await networkConnection.isConnected) {
      try {
        final data = await policServiceImp.getPolicy();
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failures, SuccessSituation>> Putpolicy(
      policyModel polic) async {
    if (await networkConnection.isConnected) {
      try {
        final data = await policServiceImp.putPolicy(polic);
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}

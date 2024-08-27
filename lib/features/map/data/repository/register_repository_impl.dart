import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/hub_entity.dart';
import '../../domain/repository/register_repository.dart';
import '../datasource/remote/Hub_service.dart';
import '../model/hub_model.dart';
import '../model/hubinfo_model.dart';

class HubRepoImpl implements HubRepo {
  final HubServiceImp hubServiceImp;

  HubRepoImpl({
    required this.hubServiceImp,
  });

  @override
  Future<Either<Failures, SuccessSituation>> getHub(HubEntity hub) async {
    try {
      final data = await hubServiceImp.getHub(hub as HubModel);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    } on PasswordExcetion {
      return Left(PasswordFailure(
          "you must put password with symbols and capital letter"));
    } on UserNameExcetion {
      return Left(UserNameFailure("you must change username"));
    }
  }
}

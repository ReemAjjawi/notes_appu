import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_connection.dart';
import '../../domain/entity/hub_entity.dart';
import '../../domain/repository/register_repository.dart';
import '../datasource/remote/Hub_service.dart';
import '../model/hub_model.dart';

class HubRepoImpl implements HubRepo {
  final HubServiceImp hubServiceImp;
  final NetworkConnection networkConnection;

  HubRepoImpl({
    required this.hubServiceImp,
    required this.networkConnection,
  });

  @override
  Future<Either<Failures, SuccessSituation>> getHub(HubEntity hub) async {
    if (await networkConnection.isConnected) {
      try {
        final data = await hubServiceImp.getHub(hub as HubModel);
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      } on EmptyException catch (e) {
        return Left(EmptyFailure(e.message));
      }
    } else {
      return Left(InternetFailure());
    }
  }
}

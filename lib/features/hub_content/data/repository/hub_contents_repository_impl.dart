import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

import '../../../../core/network/network_connection.dart';
import '../../domain/repository/hub_contents_repository.dart';
import '../datasource/remote/hub_contents_service.dart';

class HubContenRepoImpl implements HubContenRepo {
  HubContentServiceImp hubContentServiceImp;
  final NetworkConnection networkConnection;

  HubContenRepoImpl(
      {required this.hubContentServiceImp, required this.networkConnection});

  @override
  Future<Either<Failures, SuccessSituation>> getHubContents(
      int hubId, String bicycleCategory) async {
    log('==========================================================');
    if (await networkConnection.isConnected) {
      try {
        final bicycles =
            await hubContentServiceImp.getHubContents(hubId, bicycleCategory);
//List<BicycleEntity> bicycles = bicyclesList.map<BicycleEntity>((bicycle) => bicycle as BicycleEntity).toList();

        return Right(bicycles);
      } on EmptyException catch (e) {
        return Left(EmptyFailure(e.message));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}

import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

import '../../domain/entity/hub_content_entity.dart';
import '../../domain/repository/hub_contents_repository.dart';
import '../datasource/remote/hub_contents_service.dart';
import '../model/second_model.dart';

class HubContenRepoImpl implements HubContenRepo {
  HubContentServiceImp hubContentServiceImp;
  HubContenRepoImpl({required this.hubContentServiceImp});
  @override
  Future<Either<Failures, List<BicycleListModel>>> getHubContents(
      int hubId, String bicycleCategory) async {
    log('==========================================================');
    try {
      List<BicycleListModel> bicycles =
          await hubContentServiceImp.getHubContents(hubId, bicycleCategory);
//List<BicycleEntity> bicycles = bicyclesList.map<BicycleEntity>((bicycle) => bicycle as BicycleEntity).toList();
      return Right(bicycles);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

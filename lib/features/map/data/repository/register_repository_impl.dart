import 'package:dartz/dartz.dart';

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
  Future<Either<Failures, List<HubinfoModel>>> Gethub(HubEntity hub) async {
    try {
      final data = await hubServiceImp.Gethub(hub as HubModel);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    } on PasswordException {
      return Left(PasswordFailure(
          "you must put password with symbols and capital letter"));
    } on UsernameException {
      return Left(UserNameFailure("you must change username"));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';
import '../../../../core/error/failures.dart';
import '../../data/model/hubinfo_model.dart';
import '../../data/repository/register_repository_impl.dart';

class HubUseCase {
  final HubRepoImpl hubRepoImpl;

  HubUseCase({
    required this.hubRepoImpl,
  });

  Future<Either<Failures, SuccessSituation>> call(params) async {
    return await hubRepoImpl.getHub(params);
  }
}

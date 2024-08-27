import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../data/model/policy_model.dart';
import '../../data/repository/register_repository_impl.dart';

class policyUseCase {
  final policyRepoImpl policRepoImpl;

  policyUseCase({
    required this.policRepoImpl,
  });

  Future<Either<Failures, SuccessSituation>> call() async {
    return await policRepoImpl.Getpolicy();
  }
}

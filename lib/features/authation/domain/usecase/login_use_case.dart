import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../data/repository/register_repository_impl.dart';

class LogInUseCase {
  RegisterRepoImpl registerRepoImpl;
  LogInUseCase({
    required this.registerRepoImpl,
  });

  Future<Either<Failures, SuccessSituation>> call(params1) async {
    return await registerRepoImpl.LogIn(params1);
  }
}

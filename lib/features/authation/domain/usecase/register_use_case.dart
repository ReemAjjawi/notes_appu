import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../data/repository/register_repository_impl.dart';

class RegisterUseCase {
  RegisterRepoImpl registerRepoImpl;
  RegisterUseCase({
    required this.registerRepoImpl,
  });

  Future<Either<Failures, SuccessSituation>> call(params) async {
    return await registerRepoImpl.Register(params);
  }
}

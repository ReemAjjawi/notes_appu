import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../data/repository/changepassword_repository_impl.dart';

class changepasswordUseCase {
  final changepasswordRepoImpl changepassworImpl;

  changepasswordUseCase({
    required this.changepassworImpl,
  });

  Future<Either<Failures, SuccessSituation>> call(params) async {
    return await changepassworImpl.putchangepassword(params);
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../data/model/login_model.dart';
import '../../data/model/user_model.dart';

abstract class RegisterRepo {
  Future<Either<Failures, SuccessSituation>> Register(UserModel user);
  Future<Either<Failures, SuccessSituation>> LogIn(LogInModel user);
}

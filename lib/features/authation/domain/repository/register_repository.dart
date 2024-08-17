import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../data/model/login_model.dart';
import '../../data/model/user_model.dart';

abstract class RegisterRepo {
  Future<Either<Failures, Success>> Register(UserModel user);
  Future<Either<Failures, Success>> LogIn(LogInModel user);
}

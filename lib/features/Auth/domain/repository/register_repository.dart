
import 'package:dartz/dartz.dart';
import 'package:ride_application/features/auth/data/model/user_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../entity/user_entity.dart';
abstract class RegisterRepo {
  Future<Either<Failures, Success>> Register(UserModel user);
}



import 'package:dartz/dartz.dart';
import 'package:ride_application/features/Auth/data/model/article_model.dart';

import '../../../../core/error/failures.dart';
import '../entity/article_entity.dart';
abstract class RegisterRepo {
  Future<Either<Failures,bool>> signUp(UserModel user);
}


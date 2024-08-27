import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../data/model/policy_model.dart';

abstract class policyRepo {
  Future<Either<Failures, SuccessSituation>> Getpolicy();
  Future<Either<Failures, SuccessSituation>> Putpolicy(policyModel polic);
}

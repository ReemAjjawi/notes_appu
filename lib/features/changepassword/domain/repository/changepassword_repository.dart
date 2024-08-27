import 'package:dartz/dartz.dart';
import 'package:ride_application/features/changepassword/data/model/changepasswordModel.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';

abstract class changepasswordRepo {
  Future<Either<Failures, SuccessSituation>> putchangepassword(
      changepasswordModel pass);
}

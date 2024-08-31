
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/success/success.dart';
import '../../data/model/code_model.dart';
import '../../data/model/response_model.dart';
import '../entity/code_entity.dart';
abstract class AddMoneyRepo {
   Future<Either<Failures, DataSuccessObject<BalanceModel>>> addCode(String code);

}

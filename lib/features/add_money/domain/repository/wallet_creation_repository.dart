
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../data/model/wallet_model.dart';
import '../entity/wallet_entity.dart';
abstract class AddMoneyRepo {
   Future<Either<Failures, SuccessSituation>> addCode(Code codeModel);

}

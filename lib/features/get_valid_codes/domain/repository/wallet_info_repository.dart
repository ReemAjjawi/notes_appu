
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/wallet_info_model.dart';
abstract class CodeInfoRepo {
   Future<Either<Failures, List<CodeInfo>>> getValidCodes( );

}

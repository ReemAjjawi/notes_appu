import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';

abstract class CategoryRepo {
  Future<Either<Failures, SuccessSituation>> getCategories();
  Future<Either<Failures, SuccessSituation>> getBicyclesByCategory(
      String categoryName);
}

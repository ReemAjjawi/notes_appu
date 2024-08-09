
import 'package:dartz/dartz.dart';
import 'package:ride_application/features/categories/domain/entity/category_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../entity/bicycle_entity.dart';
abstract class CategoryRepo {
  Future<Either<Failures, List <CategoryEntity>>> getCategories();
    Future<Either<Failures, List <BicycleEntity>>> getBicyclesByCategory(String categoryName);

}

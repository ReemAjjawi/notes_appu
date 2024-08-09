import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/repository/category_repository_impl.dart';
import '../entity/category_entity.dart';

class CategoryUseCase{
  CategoryRepoImpl categoryRepoImpl;
  CategoryUseCase( {
    required this.categoryRepoImpl,
  });

  Future<Either<Failures, List <CategoryEntity> >> call() async {
    return await categoryRepoImpl.getCategories();
  }
}
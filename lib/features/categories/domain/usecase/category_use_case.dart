import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../data/repository/category_repository_impl.dart';

class CategoryUseCase{
  CategoryRepoImpl categoryRepoImpl;
  CategoryUseCase( {
    required this.categoryRepoImpl,
  });

  Future<Either<Failures,SuccessSituation >> call() async {
    return await categoryRepoImpl.getCategories();
  }
}
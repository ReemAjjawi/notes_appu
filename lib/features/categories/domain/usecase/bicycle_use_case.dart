// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/repository/category_repository_impl.dart';
import '../entity/bicycle_entity.dart';

class BicycleUseCase {
  CategoryRepoImpl categoryRepoImpl;
  BicycleUseCase({
    required this.categoryRepoImpl,
  });

  Future<Either<Failures, List<BicycleEntity>>> call(params) async {
    return await categoryRepoImpl.getBicyclesByCategory(params);
  }
}

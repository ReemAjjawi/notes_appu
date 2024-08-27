// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../data/repository/category_repository_impl.dart';

class BicycleUseCase {
  CategoryRepoImpl categoryRepoImpl;
  BicycleUseCase({
    required this.categoryRepoImpl,
  });

  Future<Either<Failures, SuccessSituation>> call(params) async {
    return await categoryRepoImpl.getBicyclesByCategory(params);
  }
}

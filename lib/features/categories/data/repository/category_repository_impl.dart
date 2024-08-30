import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

import '../../../../core/network/network_connection.dart';
import '../../../../core/success/success.dart';

import '../../domain/repository/category_repository.dart';
import '../datasource/remote/categories_service.dart';

class CategoryRepoImpl implements CategoryRepo {
  CategoriesServiceImp categoriesServiceImp;
  final NetworkConnection networkConnection;

  CategoryRepoImpl({
    required this.categoriesServiceImp,
    required this.networkConnection,
  });
  @override
  Future<Either<Failures, SuccessSituation>> getBicyclesByCategory(
      String categoryName) async {
    log('==========================================================');
    if (await networkConnection.isConnected) {
      try {
        final bicyclesList =
            await categoriesServiceImp.getBicyclesByCategory(categoryName);

        return Right(bicyclesList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failures, SuccessSituation>> getCategories() async {
    log('==========================================================');
    try {
      final categoriesList = await categoriesServiceImp.getCategories();
      print(categoriesList);
      return Right(categoriesList);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

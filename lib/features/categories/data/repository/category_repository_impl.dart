
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';
import 'package:ride_application/features/categories/data/datasource/remote/categories_service.dart';
import 'package:ride_application/features/categories/domain/entity/category_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

import '../../domain/entity/bicycle_entity.dart';
import '../../domain/repository/category_repository.dart';
import '../model/bicycle_model.dart';
import '../model/category_model.dart';

class CategoryRepoImpl implements CategoryRepo {
 CategoriesServiceImp categoriesServiceImp;
 CategoryRepoImpl({required this.categoriesServiceImp});
 @override
        Future<Either<Failures, List <BicycleEntity>>> getBicyclesByCategory(String categoryName) async {
log('==========================================================');
      try {
List<BicycleModel> bicyclesList = await categoriesServiceImp.getBicyclesByCategory( categoryName);
List<BicycleEntity> bicycles = bicyclesList.map<BicycleEntity>((bicycle) => bicycle as BicycleEntity).toList();
return Right(bicycles);

      } on ServerException {
        return Left(ServerFailure());
      }
   
      }
    
        @override
        Future<Either<Failures, List <CategoryEntity>>> getCategories() async {
          log('==========================================================');
      try {
List<CategoryModel> categoriesList = await categoriesServiceImp.getCategories();
List<CategoryEntity> categories = categoriesList.map<CategoryEntity>((category) => category as CategoryEntity).toList();
return Right(categories);

      } on ServerException {
        return Left(ServerFailure());
      }
   
      }



  
}

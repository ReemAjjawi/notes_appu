
import 'package:dartz/dartz.dart';
import 'package:ride_application/features/Auth/data/model/article_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/article_entity.dart';
import '../../domain/repository/register_repository.dart';
import '../datasource/remote/register_service.dart';

class RegisterRepoImpl implements RegisterRepo {
  AuthServiceImp authServiceImp;
  //LocalArticleDataSource localArticleDataSource;
 // NetworkConnection networkConnection;
  RegisterRepoImpl({
    required this.authServiceImp,

  });

  @override
  Future<Either<Failures, bool>> signUp(UserModel user) async {
    print('==========================================================');
   // print(await networkConnection.isConnected);
 //   if (await networkConnection.isConnected) {
      try {
        bool register=
            await authServiceImp.signUp(user
        );
    //    localArticleDataSource.cacheArticles(articles);
        return Right(register);
      } on ServerException {
        return Left(ServerFailure());
      }
    } 
    
  }





import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';
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
  Future<Either<Failures, Success>> Register(UserEntity user) async {
    print('==========================================================');
   // print(await networkConnection.isConnected);
 //   if (await networkConnection.isConnected) {
      try {
        Success registerDone=
            await authServiceImp.Register(user as UserModel
        );
    //    localArticleDataSource.cacheArticles(articles);
        return Right(registerDone);
      } on ServerException {
        return Left(ServerFailure());
      }
      on PasswordExcetion{
         return Left(PasswordFailure("you must put password with symbols and capital letter"));
      }
      on UserNameExcetion{
        return Left(UserNameFailure("you must change username"));
      }
      }

    } 
    
  




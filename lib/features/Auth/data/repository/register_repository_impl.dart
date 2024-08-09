
import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';
import 'package:ride_application/features/auth/data/model/user_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/user_entity.dart';
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
  Future<Either<Failures, Success>> Register(UserModel user) async {
    print('==========================================================');
      try {
        Success registerDone=
            await authServiceImp.Register(user);
 
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
    
  




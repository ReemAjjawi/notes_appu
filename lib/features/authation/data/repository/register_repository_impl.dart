import 'package:dartz/dartz.dart';
import 'package:ride_application/core/error/exceptions.dart';
import 'package:ride_application/core/error/failures.dart';
import 'package:ride_application/core/success/success.dart';
import 'package:ride_application/features/authation/data/datasource/remote/register_service.dart';
import 'package:ride_application/features/authation/data/model/login_model.dart';
import 'package:ride_application/features/authation/data/model/user_model.dart';
import 'package:ride_application/features/authation/domain/repository/register_repository.dart';


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
      Success registerDone = await authServiceImp.Register(user);

      return Right(registerDone);
    } on ServerException {
      return Left(ServerFailure());
    } on PasswordExcetion {
      return Left(PasswordFailure(
          "you must put password with symbols and capital letter"));
    } on UserNameExcetion {
      return Left(UserNameFailure("you must change username"));
    }
  }

  Future<Either<Failures, Success>> LogIn(LogInModel logn) async {
    print('==========================================================');
    try {
      Success LogInDone = await authServiceImp.LogIn(logn);

      return Right(LogInDone);
    } on ServerException {
      return Left(ServerFailure());
    } on PasswordExcetion {
      return Left(PasswordFailure(
          "you must put password with symbols and capital letter"));
    } on UserNameExcetion {
      return Left(UserNameFailure("you must change username"));
    }
  }
}

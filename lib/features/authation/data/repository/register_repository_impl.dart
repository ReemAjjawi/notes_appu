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
  Future<Either<Failures, SuccessSituation>> Register(UserModel user) async {
    print('==========================================================');
    try {
      SuccessSituation registerDone = await authServiceImp.Register(user);

      return Right(registerDone);
    } on ServerException {
      return Left(ServerFailure());
    } on PhoneException catch (e) {
      
      return Left(PhoneFailure(e.message));
    } on UsernameException catch (e) {
      return Left(UserNameFailure(e.message));
    }
    }

  Future<Either<Failures, SuccessSituation>> LogIn(LogInModel logn) async {
    print('==========================================================');
    try {
      SuccessSituation LogInDone = await authServiceImp.LogIn(logn);

      return Right(LogInDone);
    } on ServerException {
      return Left(ServerFailure());
    } on PasswordException {
      return Left(PasswordFailure(
          "you must put password with symbols and capital letter"));
    } on UsernameException {
      return Left(UserNameFailure("you must change username"));
    }
  }
}

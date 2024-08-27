import 'package:dartz/dartz.dart';
import 'package:ride_application/features/changepassword/data/model/changepasswordModel.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../domain/repository/changepassword_repository.dart';
import '../datasource/remote/changepassword_service.dart';

class changepasswordRepoImpl implements changepasswordRepo {
  final changepasswordServiceImp changepassworServiceImp;

  changepasswordRepoImpl({
    required this.changepassworServiceImp,
  });

  @override
  Future<Either<Failures, SuccessSituation>> putchangepassword(
      changepasswordModel pass) async {
    try {
      final data = await changepassworServiceImp.putchangepassword(pass);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    } 
  }
}

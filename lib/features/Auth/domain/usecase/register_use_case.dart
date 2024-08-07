// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';
import '../../../../core/error/failures.dart';
import '../../data/repository/register_repository_impl.dart';

class RegisterUseCase{
  RegisterRepoImpl registerRepoImpl;
  RegisterUseCase( {
    required this.registerRepoImpl,
  });

  Future<Either<Failures, Success >> call(params) async {
    return await registerRepoImpl.Register(params);
  }
}

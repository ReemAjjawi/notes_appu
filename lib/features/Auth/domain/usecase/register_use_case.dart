// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import 'package:ride_application/core/usecases/usecase.dart';
import 'package:ride_application/features/Auth/data/model/article_model.dart';

import '../../../../core/error/failures.dart';
import '../../data/repository/register_repository_impl.dart';
import '../entity/article_entity.dart';
import '../repository/register_repository.dart';

class SignUpUseCase{
  RegisterRepoImpl registerRepoImpl;
  SignUpUseCase({
    required this.registerRepoImpl,
  });

  Future<Either<Failures, bool >> call(params) async {
    return await registerRepoImpl.signUp(params);
  }
}

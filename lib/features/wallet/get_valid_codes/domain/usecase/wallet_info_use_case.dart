// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../data/model/wallet_info_model.dart';
import '../../data/repository/wallet_get_repository_impl.dart';

class CodeInfoUseCase {
  CodeInfoRepoImp codeInfoRepoImp;
  CodeInfoUseCase({
    required this.codeInfoRepoImp,
  });

  Future<Either<Failures, List<CodeInfo>>> call() async {
    return await codeInfoRepoImp.getValidCodes();
  }
}

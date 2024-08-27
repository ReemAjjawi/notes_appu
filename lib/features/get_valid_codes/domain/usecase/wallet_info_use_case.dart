// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:ride_application/features/get_valid_codes/domain/repository/wallet_info_repository.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/wallet_info_model.dart';
import '../../data/repository/wallet_creation_repository_impl.dart';


class WalletInfoUseCase {
  CodeInfoRepoImp codeInfoRepoImp;
  WalletInfoUseCase({
    required this.codeInfoRepoImp,
  });

   Future<Either<Failures, List<CodeInfo>>> call() async {
    return await codeInfoRepoImp.getValidCodes();
  }
}

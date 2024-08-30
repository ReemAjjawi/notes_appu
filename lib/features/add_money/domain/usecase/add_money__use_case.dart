// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:js_util';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../data/model/response_model.dart';
import '../../data/repository/add_money_repository_impl.dart';


class AddMoneyUseCase {
  AddMoneyRepoImpl addMoneyRepoImpl;
  AddMoneyUseCase({
    required this.addMoneyRepoImpl,
  });

   Future<Either<Failures, DataSuccessObject<BalanceModel>>> call(params) async {
    return await addMoneyRepoImpl.addCode(params);
  }
}

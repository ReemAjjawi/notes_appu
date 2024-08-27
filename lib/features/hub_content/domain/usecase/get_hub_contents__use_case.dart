// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';
import '../../../../core/error/failures.dart';
import '../../data/model/second_model.dart';
import '../../data/repository/hub_contents_repository_impl.dart';
import '../entity/hub_content_entity.dart';

class GetHubContentsUseCase {
  HubContenRepoImpl hubContenRepoImpl;
  GetHubContentsUseCase({
    required this.hubContenRepoImpl,
  });

  Future<Either<Failures, SuccessSituation>> call(params, params1) async {
    return await hubContenRepoImpl.getHubContents(params, params1);
  }
}

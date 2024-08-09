
import 'package:dartz/dartz.dart';
import 'package:ride_application/features/categories/domain/entity/category_entity.dart';
import 'package:ride_application/features/hub_content/data/model/second_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../entity/hub_content_entity.dart';
abstract class HubContenRepo {
  Future<Either<Failures, List <BicycleListModel>>> getHubContents(int hubId , String bicycleCategory);

}

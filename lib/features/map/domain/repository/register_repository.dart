import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/hub_model.dart';
import '../../data/model/hubinfo_model.dart';

abstract class HubRepo {
  Future<Either<Failures, SuccessSituation>> getHub(HubModel hub);
}

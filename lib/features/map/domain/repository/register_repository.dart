import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/hub_model.dart';
import '../../data/model/hubinfo_model.dart';

abstract class HubRepo {
  Future<Either<Failures, List<HubinfoModel>>> Gethub(HubModel hub);
}

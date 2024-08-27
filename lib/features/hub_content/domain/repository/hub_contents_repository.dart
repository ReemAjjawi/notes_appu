import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';

abstract class HubContenRepo {
  Future<Either<Failures, SuccessSituation>> getHubContents(
      int hubId, String bicycleCategory);
}

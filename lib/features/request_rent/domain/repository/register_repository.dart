import 'package:dartz/dartz.dart';
import 'package:ride_application/features/request_rent/data/model/reservation_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../entity/reservation_entity.dart';

abstract class ReservationRepo {
  Future<Either<Failures, Success>> makeReservation(
      ReservationModel Reservation);
}

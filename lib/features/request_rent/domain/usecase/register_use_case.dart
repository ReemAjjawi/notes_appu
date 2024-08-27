// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:ride_application/core/success/success.dart';
import '../../../../core/error/failures.dart';
import '../../data/repository/register_repository_impl.dart';

class ReservationUseCase {
  ReservationRepoImpl reservationRepoImpl;
  ReservationUseCase({
    required this.reservationRepoImpl,
  });

  Future<Either<Failures, SuccessSituation>> call(params) async {
    return await reservationRepoImpl.makeReservation(params);
  }
}

import 'package:dartz/dartz.dart';
import 'package:ride_application/core/error/exceptions.dart';
import 'package:ride_application/core/error/failures.dart';
import 'package:ride_application/core/success/success.dart';
import 'package:ride_application/features/request_rent/data/datasource/remote/register_service.dart';
import 'package:ride_application/features/request_rent/data/model/reservation_model.dart';
import 'package:ride_application/features/request_rent/domain/entity/reservation_entity.dart';
import 'package:ride_application/features/request_rent/domain/repository/register_repository.dart';

class ReservationRepoImpl implements ReservationRepo {
  final ReservationServiceImp reservationServiceImp;

  ReservationRepoImpl({
    required this.reservationServiceImp,
  });

  @override
  Future<Either<Failures, SuccessSituation>> makeReservation(
      ReservationEntity reservation) async {
    print('==========================================================');
    try {
      SuccessSituation registerDone = await reservationServiceImp
          .makeReservation(reservation as ReservationModel);
      return Right(registerDone);
    } on ServerException {
      return Left(ServerFailure());
    } on PasswordException {
      return Left(PasswordFailure(
          "You must put password with symbols and capital letter"));
    } on UsernameException {
      return Left(UserNameFailure("You must change username"));
    }
  }
}

import 'package:dio/dio.dart';
import 'package:ride_application/config/app_url.dart';
import 'package:ride_application/core/error/exceptions.dart';
import 'package:ride_application/core/success/success.dart';
import 'package:ride_application/features/request_rent/data/model/reservation_model.dart';

abstract class ReservationService {
  Future<Success> makeReservation(ReservationModel reservationModel);
}

class ReservationServiceImp implements ReservationService {
  Dio dio;
  ReservationServiceImp({
    required this.dio,
  });

  @override
  Future<Success> makeReservation(ReservationModel reservationObject) async {
    print(reservationObject.toJson());
    print('${AppUrl.baseUrl}/${AppUrl.makeReservation}');
    final _data = reservationObject.toJson();
    Response response = await dio.post(
        '${AppUrl.baseUrl}/${AppUrl.makeReservation}',
        data: reservationObject.toJson());
    print('${AppUrl.baseUrl}/${AppUrl.makeReservation}');

    if (response.statusCode == 200) {
      print(response.data);
      return DataSuccess();
    } else if (response.statusCode == 403) {
      print(response.data['message']);
      throw ServerException();
    } else {
      throw ServerException();
    }
  }
}

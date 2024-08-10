// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReservationEntity {
  int bicycleId;
  int fromHubId;
  int toHubId;
  int duration;
  String startTime;
  String endTime;
  String reservationStatus;
  String paymentMethod;

  ReservationEntity({
    required this.bicycleId,
    required this.fromHubId,
    required this.toHubId,
    required this.duration,
    required this.startTime,
    required this.endTime,
    required this.reservationStatus,
    required this.paymentMethod,
  });
}

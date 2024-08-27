import 'package:ride_application/features/request_rent/domain/entity/reservation_entity.dart';

class ReservationModel extends ReservationEntity {
  ReservationModel({
    required super.bicycleId,
    required super.fromHubId,
    required super.toHubId,
    required super.duration,
    required super.startTime,
    required super.endTime,
    required super.reservationStatus,
    required super.paymentMethod,
  });

  ReservationModel copyWith({
    int? bicycleId,
    int? fromHubId,
    int? toHubId,
    int? duration,
    String? startTime,
    String? endTime,
    String? reservationStatus,
    String? paymentMethod,
  }) {
    return ReservationModel(
      bicycleId: bicycleId ?? this.bicycleId,
      fromHubId: fromHubId ?? this.fromHubId,
      toHubId: toHubId ?? this.toHubId,
      duration: duration ?? this.duration,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      reservationStatus: reservationStatus ?? this.reservationStatus,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bicycleId': bicycleId,
      'fromHubId': fromHubId,
      'toHubId': toHubId,
      'duration': duration,
      'startTime': startTime,
      'endTime': endTime,
      'reservationStatus': reservationStatus,
      'paymentMethod': paymentMethod,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      bicycleId: map['bicycleId'] as int,
      fromHubId: map['fromHubId'] as int,
      toHubId: map['toHubId'] as int,
      duration: map['duration'] as int,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      reservationStatus: map['reservationStatus'] as String,
      paymentMethod: map['paymentMethod'] as String,
    );
  }

  @override
  String toString() {
    return 'ReservationModel(bicycleId: $bicycleId, fromHubId: $fromHubId, toHubId: $toHubId, duration: $duration, startTime: $startTime, endTime: $endTime, reservationStatus: $reservationStatus, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(covariant ReservationModel other) {
    if (identical(this, other)) return true;

    return other.bicycleId == bicycleId &&
        other.fromHubId == fromHubId &&
        other.toHubId == toHubId &&
        other.duration == duration &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.reservationStatus == reservationStatus &&
        other.paymentMethod == paymentMethod;
  }

  @override
  int get hashCode {
    return bicycleId.hashCode ^
        fromHubId.hashCode ^
        toHubId.hashCode ^
        duration.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        reservationStatus.hashCode ^
        paymentMethod.hashCode;
  }

  Map<String, dynamic> toJson() => {
        "bicycleId": bicycleId,
        "fromHubId": fromHubId,
        "toHubId": toHubId,
        "duration": duration,
        "startTime": startTime,
        "endTime": endTime,
        "reservationStatus": reservationStatus,
        "paymentMethod": paymentMethod,
      };

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      ReservationModel(
        bicycleId: json["bicycleId"],
        fromHubId: json["fromHubId"],
        toHubId: json["toHubId"],
        duration: json["duration"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        reservationStatus: json["reservationStatus"],
        paymentMethod: json["paymentMethod"],
      );
}

// reservationModelFromJson(jsonString);

// ReservationModel reservationModelFromJson(String str) =>
//     ReservationModel.fromJson(json.decode(str));

// String reservationModelToJson(ReservationModel data) =>
//     json.encode(data.toJson());

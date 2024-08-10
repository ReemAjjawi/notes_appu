// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entity/hub_entity.dart';

class HubModel extends HubEntity {
  HubModel({
    required super.latitude,
    required super.longtitude,
  });

  HubModel copyWith({
    double? latitude,
    double? longtitude,
  }) {
    return HubModel(
      latitude: latitude ?? this.latitude,
      longtitude: longtitude ?? this.longtitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longtitude': longtitude,
    };
  }

  factory HubModel.fromMap(Map<String, dynamic> map) {
    return HubModel(
      latitude: map['latitude'] as double,
      longtitude: map['longtitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory HubModel.fromJson(String source) =>
      HubModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HubModel(latitude: $latitude, longtitude: $longtitude)';
  }

  @override
  bool operator ==(covariant HubModel other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude && other.longtitude == longtitude;
  }

  @override
  int get hashCode {
    return latitude.hashCode ^ longtitude.hashCode;
  }
}

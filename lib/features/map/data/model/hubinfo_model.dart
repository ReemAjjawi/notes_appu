import 'dart:convert';

import '../../domain/entity/hubinfo_entity.dart';

class HubinfoModel extends HubinfoEntity {
  HubinfoModel({
    required super.latitude,
    required super.longitude,
    required super.id,
    required super.name,
    required super.description,
  });

  HubinfoModel copyWith({
    double? latitude,
    double? longitude,
    int? id,
    String? name,
    String? description,
  }) {
    return HubinfoModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory HubinfoModel.fromMap(Map<String, dynamic> map) {
    return HubinfoModel(
      latitude: (map['latitude'] as num).toDouble(),
      longitude: (map['longitude'] as num).toDouble(),
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HubinfoModel.fromJson(String source) =>
      HubinfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HubinfoEntity(latitude: $latitude, longitude: $longitude, id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(covariant HubinfoModel other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude &&
        other.longitude == longitude &&
        other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode {
    return latitude.hashCode ^
        longitude.hashCode ^
        id.hashCode ^
        name.hashCode ^
        description.hashCode;
  }
}

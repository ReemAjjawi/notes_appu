// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entity/policy_entity.dart';

class policyModel extends policyEntity {
  policyModel({
    super.id,
    required super.title,
    required super.description,
  });

  policyModel copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return policyModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory policyModel.fromMap(Map<String, dynamic> map) {
    return policyModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory policyModel.fromJson(String source) =>
      policyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'policyModel(id: $id, title: $title, description: $description)';

  @override
  bool operator ==(covariant policyModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode;
}

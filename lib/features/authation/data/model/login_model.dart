// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entity/login_entity.dart';

class LogInModel extends LogInEntity {
  LogInModel({
    required super.phone,
    required super.password,
  });

  LogInModel copyWith({
    String? phone,
    String? password,
  }) {
    return LogInModel(
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'password': password,
    };
  }

  factory LogInModel.fromMap(Map<String, dynamic> map) {
    return LogInModel(
      phone: map['phone'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LogInModel.fromJson(String source) =>
      LogInModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LogInModel(phone: $phone, password: $password)';

  @override
  bool operator ==(covariant LogInModel other) {
    if (identical(this, other)) return true;

    return other.phone == phone && other.password == password;
  }

  @override
  int get hashCode => phone.hashCode ^ password.hashCode;
}

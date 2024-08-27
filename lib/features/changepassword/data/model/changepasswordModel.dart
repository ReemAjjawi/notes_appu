// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entity/changepasswordEntity.dart';

class changepasswordModel extends changepasswordEntity {
  changepasswordModel(
      {required super.currentPassword,
      required super.newPassword,
      required super.confirmPassword});

  changepasswordModel copyWith({
    String? currentPassword,
    String? newPassword,
    String? confirmPassword,
  }) {
    return changepasswordModel(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentPassword': currentPassword,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };
  }

  factory changepasswordModel.fromMap(Map<String, dynamic> map) {
    return changepasswordModel(
      currentPassword: map['currentPassword'] as String,
      newPassword: map['newPassword'] as String,
      confirmPassword: map['confirmPassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory changepasswordModel.fromJson(String source) =>
      changepasswordModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'changepasswordModel(currentPassword: $currentPassword, newPassword: $newPassword, confirmPassword: $confirmPassword)';

  @override
  bool operator ==(covariant changepasswordModel other) {
    if (identical(this, other)) return true;

    return other.currentPassword == currentPassword &&
        other.newPassword == newPassword &&
        other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode =>
      currentPassword.hashCode ^
      newPassword.hashCode ^
      confirmPassword.hashCode;
}

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class changepasswordEntity {
  String currentPassword;
  String newPassword;
  String confirmPassword;

  changepasswordEntity({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}

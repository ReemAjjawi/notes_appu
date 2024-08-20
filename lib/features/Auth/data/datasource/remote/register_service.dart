// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import 'package:ride_application/features/auth/data/model/user_model.dart';

import '../../../../../config/app_url.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/service.dart';
import '../../../../../core/success/success.dart';
import '../../../domain/entity/user_entity.dart';

class AuthServiceImp extends CoreService {
  @override
  Dio dio;
  AuthServiceImp({
    required this.dio,
  });

  Future<Success> Register(UserModel user) async {
    print(user.toMap());
    print('${AppUrl.baseUrl}/${AppUrl.signUp}');
    final data = user.toMap();
    try {
      Response response = await dio.post('${AppUrl.baseUrl}/${AppUrl.signUp}',
          data: user.toJson());
      print('${AppUrl.baseUrl}/${AppUrl.signUp}');

      if (response.statusCode == 200) {
        print(response.data);

        String token = response.data['body']['token'];
        var box = Hive.box('projectBox');

        box.put('token', token);

        return DataSuccess();
      }
    } on DioException catch (e) {
      print("e");
      if ((e.response!.data["message"] as List<dynamic>).any((element) =>
          element.contains(
              "Password must contain 1 or more uppercase characters."))) {
        print("=========================");
        throw PasswordMustContainOneUppercase(
            "Password must contain 1 or more uppercase characters.");
      }
    }

    throw ServerException();
  }
}

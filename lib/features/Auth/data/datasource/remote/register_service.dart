// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import 'package:ride_application/features/Auth/data/model/article_model.dart';

import '../../../../../config/app_url.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/service.dart';
import '../../../domain/entity/article_entity.dart';

class AuthServiceImp {
  Dio dio;
  AuthServiceImp({
    required this.dio,
  });

  Future<bool> signUp(UserModel user) async {
    print(user.toMap());
    print('${AppUrl.baseUrl}/${AppUrl.signUp}');
    final _data = user.toMap();
    Response response = await dio.post('${AppUrl.baseUrl}/${AppUrl.signUp}',
        data: user.toJson());
    print('${AppUrl.baseUrl}/${AppUrl.signUp}');

    if (response.statusCode == 200) {
      print(response.data);

      String token = response.data['body']['token'];
      var box = Hive.box('projectBox');

      box.put('token', token);

      return true;
    } else {
      throw ServerException();
    }
  }
}

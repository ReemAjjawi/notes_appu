// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:dio/dio.dart';

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
   

  Future <bool> signUp( UserModel user) async {
    print(user.toMap());
     print('${AppUrl.baseUrl}/${AppUrl.signUp}');
        final _data =user.toMap();
  Response  response = await dio.post(
      '${AppUrl.baseUrl}/${AppUrl.signUp}',data: user.toMap()
    );
      print('${AppUrl.baseUrl}/${AppUrl.signUp}');
      print(response.statusCode);

    if (response.statusCode == 200) {
   //   print(response.data);
     
      return true;
    } else {
      throw ServerException();
    }
  }
}

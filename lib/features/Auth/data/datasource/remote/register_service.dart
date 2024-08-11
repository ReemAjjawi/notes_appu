// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import 'package:ride_application/features/auth/data/model/user_model.dart';

import '../../../../../config/app_url.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/service.dart';
import '../../../../../core/success/success.dart';
import '../../../domain/entity/user_entity.dart';

class AuthServiceImp extends CoreService {
Dio dio;
  AuthServiceImp({
    required this.dio,
  });

  Future<Success> Register(UserModel user) async {
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

      return  DataSuccess();
    } else if(response.statusCode == 403 ){
      print(response.data['message']);
      throw PasswordExcetion(response.data['message']);
    }
    else
    {
      throw ServerException();
    }
   
  }
}


// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:ride_application/config/app_url.dart';
import 'package:ride_application/core/error/exceptions.dart';
import 'package:ride_application/core/success/success.dart';
import 'package:ride_application/features/authation/data/model/login_model.dart';
import 'package:ride_application/features/authation/data/model/user_model.dart';

abstract class AuthService {
  Future<SuccessSituation> Register(UserModel user);
  Future<SuccessSituation> LogIn(LogInModel logn);
}

class AuthServiceImp implements AuthService {
  Dio dio;
  AuthServiceImp({
    required this.dio,
  });
  Future<SuccessSituation> Register(UserModel user) async {
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

      return DataSuccess();
    } else if (response.statusCode == 403) {
      print(response.data['message']);
      throw PasswordExcetion(response.data['message']);
    } else {
      throw ServerException();
    }
  }

  Future<SuccessSituation> LogIn(LogInModel logn) async {
    print(logn.toMap());
    print('${AppUrl.baseUrl}/${AppUrl.logIn}');
    final _data = logn.toMap();
    Response response = await dio.post('${AppUrl.baseUrl}/${AppUrl.logIn}',
        data: logn.toJson());
    print('${AppUrl.baseUrl}/${AppUrl.logIn}');

    if (response.statusCode == 200) {
      print(response.data);

      String token = response.data['body']['token'];
      var box = Hive.box('projectBox');

      box.put('token', token);

      return DataSuccess();
    } else if (response.statusCode == 403) {
      print(response.data['message']);
      throw PasswordExcetion(response.data['message']);
    } else {
      throw ServerException();
    }
  }
}

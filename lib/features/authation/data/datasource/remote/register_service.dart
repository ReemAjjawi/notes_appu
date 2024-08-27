// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

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
  
    try {
      Response response = await dio.post('${AppUrl.baseUrl}/${AppUrl.signUp}',
        data: user.toJson());

    if (response.statusCode == 200) {
      String token = response.data['body']['token'];
      var box = Hive.box('projectBox');
      box.put('token', token);
      return DataSuccess();
    } 
  } on DioException catch (e) {
    String? message = e.response?.data['message'];
    print("iam in catch");
    print(e.response?.data);

    if (e.response?.statusCode == 400) {
      log("iam in register");
      if (message == 'Username already in use') {
        throw UsernameException(message);
      } else if (message == 'phone number already in use') {
        throw PhoneException(message);
      } else if (message != null && message.contains('Password must be')) {
        throw PasswordException(message);
      } 
    }

    throw ServerException();
  }

  throw ServerException();
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
      throw PasswordException(response.data['message']);
    } else {
      throw ServerException();
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ride_application/config/header_config.dart';
import 'package:ride_application/features/changepassword/data/model/changepasswordModel.dart';

import '../../../../../config/app_url.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/service.dart';
import '../../../../../core/success/success.dart';

class changepasswordServiceImp extends CoreService {
  Dio dio;
  changepasswordServiceImp({
    required this.dio,
  });

  Future<SuccessSituation> putchangepassword(changepasswordModel pass) async {
    print(pass.toMap());
    try {
      Response response = await dio.put(
          '${AppUrl.baseUrl}/${AppUrl.changepassword}',
          data: pass.toMap(),
          options: HeaderConfig.getHeader());

      print(response.data);
      if (response.statusCode == 202) {
        print("Change password done successfully");
        return DataSuccess();
      }
    } catch (e) {
      throw ServerException(message: "try again");
    }
    throw ServerException(message: "try again");
  }
}

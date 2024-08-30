// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:ride_application/config/header_config.dart';

import '../../../../../config/app_url.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/success/success.dart';
import '../../model/policy_model.dart';

abstract class policyService {
  Future<SuccessSituation> getPolicy();
  Future<SuccessSituation> putPolicy(policyModel polic);
}

class policyServiceImp extends policyService {
  Dio dio;
  policyServiceImp({
    required this.dio,
  });
  @override
  Future<SuccessSituation> getPolicy() async {
    print("jjjjjjjjjjjjjjjjjjj");
    try {
      Response response = await dio.get('${AppUrl.baseUrl}/${AppUrl.policy}',
          options: HeaderConfig.getHeader());

      if (response.statusCode == 200) {
        print(response.data);
        print("dddd");

        policyModel data = policyModel.fromMap(response.data['body']);
        print("dddd");
        print(data);
        return DataSuccessObject(data: data);
      }
    } catch (e) {
      throw ServerException(message: "try again");
    }
    throw ServerException(message: "try again");
  }

  @override
  Future<SuccessSituation> putPolicy(policyModel polic) async {
    print("jjjjjjjjjjjjjjjjjjj");
    try {
      Response response = await dio.put('${AppUrl.baseUrl}/${AppUrl.policy}',
          data: polic.toMap(), options: HeaderConfig.getHeader());

      if (response.statusCode == 200) {
        print(response.data);

        return DataSuccess();
      }
    } catch (e) {
      throw ServerException(message: "try again");
    }
    throw ServerException(message: "try again");
  }
}

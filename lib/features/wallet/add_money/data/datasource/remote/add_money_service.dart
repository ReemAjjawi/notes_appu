import 'dart:developer';

import 'package:dio/dio.dart';
import '../../../../../../config/app_url.dart';
import '../../../../../../config/header_config.dart';
import '../../../../../../core/error/exceptions.dart';
import '../../../../../../core/success/success.dart';
import '../../model/code_model.dart';
import '../../model/response_model.dart';

abstract class AddMoneyService {
  Future<DataSuccessObject<BalanceModel>> addCode(String code );
}

class AddMoneyServiceImp implements AddMoneyService {
  Dio dio;
  AddMoneyServiceImp({
    required this.dio,
  });

  @override
  Future<DataSuccessObject<BalanceModel>> addCode(String code) async {
    try {
      print('${AppUrl.baseUrl}/${AppUrl.createWallet}');

      Response response = await dio.put(
          '${AppUrl.baseUrl}/${AppUrl.addMoneyToWallet}',
          data: {"code":code} ,
          options: HeaderConfig.getHeader(useToken: true));

      if (response.statusCode == 202) {
        print(response.data);
      BalanceModel model = BalanceModel.fromMap(response.data['body']);
return DataSuccessObject<BalanceModel>(data: model);

      }
    } on DioException catch (e) {
      String? message = e.response?.data['message'];
      print("iam in catch");
      print(e.response?.data);

      if (e.response!.statusCode == 400) {
        log("iam in register");
        if (message == "CODE NOT VALID") {
          throw CodeException(message!);
        }
      }
    }
    throw ServerException(message: "try again");
  }
}

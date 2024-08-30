
import 'package:dio/dio.dart';
import '../../../../../config/app_url.dart';
import '../../../../../config/header_config.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/success/success.dart';
import '../../model/wallet_model.dart';

abstract class AddMoneyService {
  Future<SuccessSituation> addCode(Code codeModel);
}

class AddMoneyServiceImp implements AddMoneyService {
  Dio dio;
  AddMoneyServiceImp({
    required this.dio,
  });

  @override
  Future<SuccessSituation>  addCode(Code codeModel) async {
    try {
      print('${AppUrl.baseUrl}/${AppUrl.createWallet}');
    print(codeModel);
      Response response = await dio.post(
          '${AppUrl.baseUrl}/${AppUrl.addMoneyToWallet}',
          data: codeModel.toMap(),
          options: HeaderConfig.getHeader(useToken: true));
     
      if (response.statusCode == 200) {
        print(response.data);

        return DataSuccess();
      }
    } on DioException catch (e) {
      print(e.message!);
    }
    throw ServerException();
  }
}

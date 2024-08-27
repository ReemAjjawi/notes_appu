
import 'package:dio/dio.dart';

import '../../../../../config/app_url.dart';
import '../../../../../config/header_config.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/success/success.dart';
import '../../model/wallet_model.dart';

abstract class WalletCreationService {
  Future<SuccessSituation> createWallet(Wallet walletModel);
}

class WalletCreationServiceImp implements WalletCreationService {
  Dio dio;
  WalletCreationServiceImp({
    required this.dio,
  });

  @override
  Future<SuccessSituation> createWallet(Wallet walletModel) async {
    try {
      print('${AppUrl.baseUrl}/${AppUrl.createWallet}');
    print(walletModel);
      Response response = await dio.post(
          '${AppUrl.baseUrl}/${AppUrl.createWallet}',
          data: walletModel.toMap(),
          options: HeaderConfig.getHeader(useToken: true));
      print('${AppUrl.baseUrl}/${AppUrl.createWallet}');
      print(walletModel);
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

import 'package:dio/dio.dart';
import '../../../../../../config/app_url.dart';
import '../../../../../../config/header_config.dart';
import '../../../../../../core/error/exceptions.dart';
import '../../model/wallet_info_model.dart';

abstract class WalletInfoService {
  Future<WalletInfo> getWalletInfo();
}

class WalletInfoServiceImp implements WalletInfoService {
  Dio dio;
  WalletInfoServiceImp({
    required this.dio,
  });

  @override
  Future<WalletInfo> getWalletInfo() async {
    try {
      print('${AppUrl.baseUrl}/${AppUrl.getWalletInfo}');
      // print(walletModel);
      Response response = await dio.get(
          '${AppUrl.baseUrl}/${AppUrl.createWallet}',
          options: HeaderConfig.getHeader(useToken: true));
      print('${AppUrl.baseUrl}/${AppUrl.getWalletInfo}');
      // print(walletModel);
      if (response.statusCode == 200) {
        print(response);
        print(response.data);
        print(response.data['body']);
 WalletInfo walletInfo = WalletInfo.fromJson(response.data['body']);
        return walletInfo;
      }
    } on DioException catch (e) {
      print(e.message!);
    }
    throw ServerException(message: "try again");
  }
}










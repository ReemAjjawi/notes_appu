import 'package:dio/dio.dart';
import '../../../../../config/app_url.dart';
import '../../../../../config/header_config.dart';
import '../../../../../core/error/exceptions.dart';
import '../../model/wallet_info_model.dart';

abstract class CodeInfoService {
  Future<List<CodeInfo>> getValidCodes();
}

class CodeInfoServiceImp implements CodeInfoService {
  Dio dio;
  CodeInfoServiceImp({required this.dio});

  @override
  Future<List<CodeInfo>> getValidCodes() async {
    try {
      print('${AppUrl.baseUrl}/${AppUrl.getValidCodes}');
      Response response = await dio.get(
        '${AppUrl.baseUrl}/${AppUrl.getValidCodes}',
        options: HeaderConfig.getHeader(useToken: true),
      );

      if (response.statusCode == 200) {
        print(response.data);

        List<dynamic> jsonBody = response.data['body'];

        // Generate a list of CodeInfo from the JSON data
        List<CodeInfo> validCodes = List.generate(
          jsonBody.length,
          (index) => CodeInfo.fromJson(jsonBody[index]),
        );

        return validCodes;
      }
    } on DioException catch (e) {
      print(e.response!.data!);
            print(e.response!);

       print(e.message!);
            

    }
    throw ServerException();
  }
}

import 'package:dio/dio.dart';
import 'package:ride_application/core/success/success.dart';
import 'package:ride_application/features/hub_content/data/model/second_model.dart';
import '../../../../../config/app_url.dart';
import '../../../../../config/header_config.dart';
import '../../../../../core/error/exceptions.dart';

abstract class HubContentService {
  Future<SuccessSituation> getHubContents(int hnbId, String bicycleCategory);
}

class HubContentServiceImp implements HubContentService {
  Dio dio;
  HubContentServiceImp({
    required this.dio,
  });

  @override
  Future<SuccessSituation> getHubContents(
      int hnbId, String bicycleCategory) async {
    print(
        '${AppUrl.baseUrl}/${AppUrl.getHubContent}$hnbId?bicycleCategory=$bicycleCategory');

    try {
      Response response = await dio.get(
          '${AppUrl.baseUrl}/${AppUrl.getHubContent}/$hnbId?bicycleCategory=$bicycleCategory',
          options: HeaderConfig.getHeader(useToken: true));
    
      if (response.statusCode == 200) {
       
        List<BicycleListModel> bicycles = List.generate(
          response.data['body']['bicycleList'].length,
          (index) => BicycleListModel.fromJson(
              response.data['body']['bicycleList'][index]),
        );
        return DataSuccessList(data: bicycles);
      }
    } on DioException catch (e) {
          String? message = e.response?.data['message'];
    print("iam in catch");
    print(e.response?.data);

      if (message == 'Username already in use') {

  
        throw EmptyException(e.response?.data['message'] ?? 'Unknown Error');
      }
    }

    throw ServerException();
  }
}

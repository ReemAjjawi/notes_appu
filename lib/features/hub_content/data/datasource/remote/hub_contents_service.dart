import 'package:dio/dio.dart';
import 'package:ride_application/features/hub_content/data/model/second_model.dart';

import '../../../../../config/app_url.dart';
import '../../../../../config/header_config.dart';
import '../../../../../core/error/exceptions.dart';

abstract class HubContentService {
  Future<List<BicycleListModel>> getHubContents(
      int hnbId, String bicycleCategory);
}

class HubContentServiceImp implements HubContentService {
  Dio dio;
  HubContentServiceImp({
    required this.dio,
  });

  @override
  Future<List<BicycleListModel>> getHubContents(
      int hnbId, String bicycleCategory) async {
    print(
        '${AppUrl.baseUrl}/${AppUrl.getHubContent}/$hnbId?bicycleCategory=$bicycleCategory');

    Response response = await dio.get(
        '${AppUrl.baseUrl}/${AppUrl.getHubContent}/$hnbId?bicycleCategory=$bicycleCategory',
        options: HeaderConfig.getHeader(useToken: true));
    print(
        '${AppUrl.baseUrl}/${AppUrl.getHubContent}/$hnbId?bicycleCategory=$bicycleCategory');
    if (response.statusCode == 200) {
      print(response.data);

      // Assuming response.data is a map and HubContentModel has a fromMap factory constructor
      List<BicycleListModel> bicycles = List.generate(
        response.data['body']['bicycleList'].length,
        (index) => BicycleListModel.fromJson(
            response.data['body']['bicycleList'][index]),
      );
      return bicycles;
    } else if (response.statusCode == 403) {
      print(response.data['message']);
      throw ServerException();
    } else {
      throw ServerException();
    }
  }
}

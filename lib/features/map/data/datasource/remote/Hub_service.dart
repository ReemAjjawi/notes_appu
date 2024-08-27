// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:ride_application/config/header_config.dart';

import '../../../../../config/app_url.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/service.dart';
import '../../../../../core/success/success.dart';
import '../../model/hub_model.dart';
import '../../model/hubinfo_model.dart';

class HubServiceImp extends CoreService {
  Dio dio;
  HubServiceImp({
    required this.dio,
  });

  Future<SuccessSituation> getHub(HubModel hub) async {
    print(hub.toMap());
    Response response = await dio.get(
        '${AppUrl.baseUrl}/${AppUrl.getAllHubs}longtitude=${hub.longtitude}&latitude=${hub.latitude}',
        options: HeaderConfig.getHeader());

    print(response.data);

    if (response.statusCode == 200) {
      print(response.data);
      List<HubinfoModel> data = List.generate(
        response.data['body'].length,
        (index) => HubinfoModel.fromMap(
          response.data['body'][index],
        ),
      );
      print(data);
      print("eeeeeeeeeeeeeeeeeee");
      return DataSuccessList(data: data) ;
    } else if (response.statusCode == 403) {
      print(response.data['message']);
      throw PasswordExcetion(response.data['message']);
    } else {
      throw ServerException();
    }
  }
}

import 'package:dio/dio.dart';
import 'package:ride_application/core/success/success.dart';

import '../../../../../config/app_url.dart';
import '../../../../../config/header_config.dart';
import '../../../../../core/error/exceptions.dart';
import '../../model/bicycle_model.dart';
import '../../model/category_model.dart';

abstract class CategoriesService {
  Future<SuccessSituation> getCategories();
  Future<SuccessSituation> getBicyclesByCategory(String categoryName);
}

class CategoriesServiceImp implements CategoriesService {
  Dio dio;
  CategoriesServiceImp({
    required this.dio,
  });

  @override
  Future<SuccessSituation> getBicyclesByCategory(String categoryName) async {
    print(
        '${AppUrl.baseUrl}/${AppUrl.getBicyclesByCategory}?category=$categoryName');

    print("hiiiii");

    Response response = await dio.get(
        '${AppUrl.baseUrl}/${AppUrl.getBicyclesByCategory}?category=$categoryName',
        options: HeaderConfig.getHeader(useToken: true));
    print("hiiiii");
    if (response.statusCode == 200) {
      print(response.data);

      print("hiiiii");
      List<BicycleModel> bicycles = List.generate(
        response.data['body'].length,
        (index) => BicycleModel.fromJson(response.data['body'][index]),
      );
      // List<BicycleEntity> bicycle =
      //     bicycles.map<BicycleEntity>((bicycle) => bicycle).toList();
      return DataSuccessList(data: bicycles);
    } else {
      throw ServerException(message:"try again");
    }
  }

  @override
  Future<SuccessSituation> getCategories() async {
    print('${AppUrl.baseUrl}/${AppUrl.getAllCategories}');
    try {
      Response response = await dio.get(
          '${AppUrl.baseUrl}/${AppUrl.getAllCategories}',
          options: HeaderConfig.getHeader(useToken: true));
      print('${AppUrl.baseUrl}/${AppUrl.getAllCategories}');
      print(response);
      if (response.statusCode == 200) {
        List<CategoryModel> categories = List.generate(
          response.data['body'].length,
          (index) => CategoryModel.fromJson(response.data['body'][index]),
        );
        // List<CategoryEntity> categorie =
        //     categories.map<CategoryEntity>((category) => category).toList();

        return DataSuccessList(data: categories);
      } else {
        print(response.data['message']);
        print("error in else ");
        throw ServerException(message:"try again");
      }
    } on DioException catch (e) {
      print("iam in catch");
      print(e.response!.data);
      print("hi");
      print((e.response!.statusCode));
      throw ServerException(message:e.response!.data );
    }
  }
}

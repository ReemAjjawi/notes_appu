import 'package:dio/dio.dart';
import 'package:ride_application/config/app_url.dart';
import 'package:ride_application/core/error/exceptions.dart';
import 'package:ride_application/features/categories/data/model/bicycle_model.dart';
import 'package:ride_application/features/categories/data/model/category_model.dart';

abstract class CategoriesService {
  Future<List<CategoryModel>> getCategories();
  Future<List<BicycleModel>> getBicyclesByCategory(String categoryName);
}

class CategoriesServiceImp implements CategoriesService {
  Dio dio;
  CategoriesServiceImp({
    required this.dio,
  });

  @override
  Future<List<BicycleModel>> getBicyclesByCategory(String categoryName) async {
    print(
        '${AppUrl.baseUrl}/${AppUrl.getBicyclesByCategory}?category=$categoryName');

    print("hiiiii");
    try {
      Response response = await dio.get(
          '${AppUrl.baseUrl}/${AppUrl.getBicyclesByCategory}?category=$categoryName',
          options: Options(
            headers: {
              "accept": "*/*",
              "Authorization":
                  "Bearer ${("eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTc2NTQzMjU2IiwiaWF0IjoxNzIzMjY1NzQ5LCJleHAiOjE3MjMzNTIxNDl9.h4dCXHiFF941Y5EzjfFx3IZJCPDq839rYzae0spWyso")}"
            },
          ));
      print("hiiiii");
      if (response.statusCode == 200) {
        print(response.data);

        print("hiiiii");
        List<BicycleModel> bicycles = List.generate(
          response.data['body'].length,
          (index) => BicycleModel.fromJson(response.data['body'][index]),
        );
        return bicycles;
      }
    } on DioException catch (e) {
      print(e.response?.data["messasge"]);
    }
    throw ServerException();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    print('${AppUrl.baseUrl}/${AppUrl.getAllCategories}');

    Response response = await dio.get(
      '${AppUrl.baseUrl}/${AppUrl.getAllCategories}',
      options: Options(
        headers: {
          "accept": "*/*",
          "Authorization":
              "Bearer ${("eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTc2NTQzMjU2IiwiaWF0IjoxNzIzMjY1NzQ5LCJleHAiOjE3MjMzNTIxNDl9.h4dCXHiFF941Y5EzjfFx3IZJCPDq839rYzae0spWyso")}"
        },
      ),
    );

    if (response.statusCode == 200) {
      print(response.data['']);

      print("response");
      print(response);
      print(response.data);
      print(response.data['body']);
      print("response.data['body']");

      List<CategoryModel> categories = List.generate(
        response.data['body'].length,
        (index) => CategoryModel.fromJson(response.data['body'][index]),
      );
      return categories;
    } else if (response.statusCode == 403) {
      print(response.data['message']);
      throw PasswordException(response.data['message']);
    } else {
      throw ServerException();
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';

import '../../../../../config/app_url.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../model/article_model.dart';

class RemoteArticleDataSource {
  Dio dio;
  RemoteArticleDataSource({
    required this.dio,
  });

  Future<List<ArticleModel>> getAllArticles(
      String apiKey, String country, String endPoint) async {
    Response response = await dio.get(
      '${AppUrl.baseUrl}/${AppUrl.endPoint}?country=${Constants.country}&category=${Constants.category}&apiKey=${Constants.apiKey}',
    );

    if (response.statusCode == 200) {
      print(response.data['articles']);
      List<ArticleModel> articles = List.generate(
        response.data['articles'].length,
        (index) => ArticleModel.fromMap(
          response.data['articles'][index],
        ),
      );
      return articles;
    } else {
      throw ServerException();
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import '../../../../config/app_url.dart';
import '../../../../core/constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_connection.dart';
import '../../domain/entity/article_entity.dart';
import '../../domain/repository/article_repository.dart';
import '../datasource/local/local_article_data_source.dart';
import '../datasource/remote/remote_article_data_source.dart';
import '../model/article_model.dart';

class ArticleRepoImpl implements ArticleRepo {
  RemoteArticleDataSource remoteArticleDataSource;
  LocalArticleDataSource localArticleDataSource;
  NetworkConnection networkConnection;
  ArticleRepoImpl({
    required this.remoteArticleDataSource,
    required this.localArticleDataSource,
    required this.networkConnection,
  });

  @override
  Future<Either<Failures, List<ArticleEntity>>> getAllArticels() async {
    print('==========================================================');
    print(await networkConnection.isConnected);
    if (await networkConnection.isConnected) {
      try {
        List<ArticleModel> articles =
            await remoteArticleDataSource.getAllArticles(
          Constants.apiKey,
          Constants.country,
          AppUrl.endPoint,
        );
        localArticleDataSource.cacheArticles(articles);
        return Right(articles);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        List<ArticleModel> articles =
            await localArticleDataSource.getArticles();
        return Right(articles);
      } on EmptyCacheException {
        return Left(
          EmptyCacheFailure(),
        );
      }
      
    }
    
  }
}

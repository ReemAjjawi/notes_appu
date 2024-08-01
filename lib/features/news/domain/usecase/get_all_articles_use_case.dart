
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/article_entity.dart';
import '../repository/article_repository.dart';

class GetAllArticelsUseCase {
  ArticleRepo articleRepo;
  GetAllArticelsUseCase({
    required this.articleRepo,
  });

  Future<Either<Failures, List<ArticleEntity>>> call() async {
    return await articleRepo.getAllArticels();
  }
}

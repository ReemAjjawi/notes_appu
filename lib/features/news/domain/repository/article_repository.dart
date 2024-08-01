
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/article_entity.dart';

abstract class ArticleRepo {
  Future<Either<Failures, List<ArticleEntity>>> getAllArticels();
}

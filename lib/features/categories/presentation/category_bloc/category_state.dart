// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:ride_application/features/categories/domain/entity/category_entity.dart';

import '../../../../core/success/success.dart';

@immutable
sealed class CategoriesClassState {}

//final class InitialState extends CategoriesClassState {}

class Success extends CategoriesClassState {
  final DataSuccessList<CategoryEntity> categories;
  Success({
    required this.categories,
  });
}

class LoadingStateca extends CategoriesClassState {}

class FailureStateca extends CategoriesClassState {
  final String message;

  FailureStateca({required this.message});
}

class internetStateca extends CategoriesClassState {
  final String message;

  internetStateca({required this.message});
}

class unknowStateca extends CategoriesClassState {
  final String message;

  unknowStateca({required this.message});
}

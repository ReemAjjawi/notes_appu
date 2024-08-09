// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:ride_application/features/categories/domain/entity/category_entity.dart';


@immutable
sealed class CategoriesClassState {}

//final class InitialState extends CategoriesClassState {}


class Success extends CategoriesClassState {
  final List<CategoryEntity> categories;
  Success({
    required this.categories,
  });

}
class LoadingState extends CategoriesClassState {}

class FailureState extends CategoriesClassState {
   final String message;

   FailureState({required this.message});


}

// class UsernameFailureState extends RegisterClassState {
//   final String message;

//   UsernameFailureState({required this.message});
// }

// class PasswordFailureState extends RegisterClassState {
//   final String message;

//   PasswordFailureState({required this.message});
// }

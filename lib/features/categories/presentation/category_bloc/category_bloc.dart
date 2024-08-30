import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/features/categories/presentation/category_bloc/category_state.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/success/success.dart';
import '../../data/model/category_model.dart';
import '../../domain/usecase/category_use_case.dart';
import 'category_event.dart';

class CategoryBloc extends Bloc<CategoriesClassEvent, CategoriesClassState> {
  final CategoryUseCase categoryUseCase;
  CategoryBloc(this.categoryUseCase) : super(LoadingState()) {
    on<GetCategoryEvent>((event, emit) async {
      print("Hi bloc");
      // emit(LoadingState());
      final failureOrEntity = await categoryUseCase.call();

      failureOrEntity.fold((failure) {
        String message = '';
        switch (failure.runtimeType) {
          case ServerFailure():
            message = "please try again";
            emit(FailureState(message: message));
            break;
        }
      }, (success) {
        if (success is DataSuccessList<CategoryModel>) {
          print("Success with data: ${success.data}");
          emit(Success(categories: success));
        }
      });
    });
  }
}


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/features/categories/presentation/category_bloc/category_state.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecase/category_use_case.dart';
import 'category_event.dart';

class CategoryBloc extends Bloc<CategoriesClassEvent, CategoriesClassState> {
  final CategoryUseCase categoryUseCase;
  CategoryBloc(this.categoryUseCase) : super(LoadingState()) {
    on<GetCategoryEvent>((event, emit) async {
     // emit(LoadingState());
      final failureOrEntity = await categoryUseCase.call();

      failureOrEntity.fold((failure) {
        String message = '';
        switch (failure.runtimeType) {
        //  case PasswordFailure():
// emit(FailurePasswordState(message: message));
     //       break;
//case UserNameFailure()
// emit(FailureusernameState(message: message));
     //       break;
    case ServerFailure():
    message="please try again";
       emit(FailureState(message: message));
       break;
        }
     
      }, (categories) {
        emit(
          Success(categories:categories ),
        );
      });
    });
  }
}

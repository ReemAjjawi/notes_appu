import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:ride_application/features/Auth/data/model/article_model.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entity/article_entity.dart';
import '../../domain/usecase/register_use_case.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class AuthBloc extends Bloc<RegisterClassEvent, RegisterClassState> {
  final SignUpUseCase signUpUseCase;
  AuthBloc(this.signUpUseCase) : super(InitialState()) {
    on<RegisterEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrEntity = await signUpUseCase.call(UserModel(firstName: "firstName", lastName: "lastName", phone: "0998198912", username: "rjhtfddffg", birthDate: "2024-08-02", password: "123**hcfdtATThh", confirmPassword: "confirmPassword"));

      failureOrEntity.fold((failure) {
        String message = '';
        switch (failure.runtimeType) {
          case ServerFailure:
            message = 'Please try again later.. ';
            break;

          default:
            message = 'there is no error';
            break;
        }
        emit(FailureState(message: message));
      }, (success) {
        emit(
          SuccessState(),
        );
      });
    });
  }
}

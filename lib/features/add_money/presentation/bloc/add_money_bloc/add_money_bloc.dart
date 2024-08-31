import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/core/success/success.dart';
import 'package:ride_application/features/add_money/data/model/response_model.dart';

import '../../../../../core/error/failures.dart';
import '../../../../wallet/domain/usecase/wallet_creation_use_case.dart';

import '../../../data/model/code_model.dart';
import '../../../domain/usecase/add_money__use_case.dart';
import 'add_money_event.dart';
import 'add_money_state.dart';

class AddMoneyBloc extends Bloc<AddMoneyClassEvent, AddMoneyClassState> {
  final AddMoneyUseCase addMoneyUseCase;
  AddMoneyBloc(this.addMoneyUseCase) : super(InitialState()) {
    on<AddMoneyEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrEntity = await addMoneyUseCase.call(event.code);
      print("iam in bloc ");
      print(event.code);
      failureOrEntity.fold((failure) {
        String message = '';
        switch (failure.runtimeType) {
          case ServerFailure():
            message = "please try again";
            emit(FailureState(message: message));
            break;
        }
      }, (dataSuccessObject) {
        if (dataSuccessObject is DataSuccessObject<BalanceModel>) {
          emit(
            SuccessState(model: dataSuccessObject.data),
          );
        }
      });
    });
  }
}

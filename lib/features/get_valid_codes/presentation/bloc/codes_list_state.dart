
import '../../data/model/wallet_info_model.dart';

sealed class CodesListClassState {}

class SuccessStateCodesList extends CodesListClassState {
  List<CodeInfo> codesInfo;
  SuccessStateCodesList({
    required this.codesInfo,
  });
}

class LoadingStateCodesList extends CodesListClassState {}

class FailureStateCodesList extends CodesListClassState {
  final String message;

  FailureStateCodesList({required this.message});
}

// ignore_for_file: public_member_api_docs, sort_constructors_first


import '../../../data/model/code_model.dart';

sealed class AddMoneyClassEvent {}

class AddMoneyEvent extends AddMoneyClassEvent {
Code code;
  AddMoneyEvent({
    required this.code,
  });

 


}

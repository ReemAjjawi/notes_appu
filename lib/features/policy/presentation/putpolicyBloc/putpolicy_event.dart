// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'putpolicy_bloc.dart';

@immutable
sealed class putpolicyClassEvent {}

class putpolicyEvent extends putpolicyClassEvent {
  policyModel pass;
  putpolicyEvent({
    required this.pass,
  });
}

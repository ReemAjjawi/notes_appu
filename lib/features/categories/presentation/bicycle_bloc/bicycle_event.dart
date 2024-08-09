// ignore_for_file: public_member_api_docs, sort_constructors_first


sealed class BicyclesClassEvent {}

class GetBicycleEvent extends BicyclesClassEvent {
String categoryName;
  GetBicycleEvent({
    required this.categoryName,
  });
}

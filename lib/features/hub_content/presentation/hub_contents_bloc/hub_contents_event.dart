// ignore_for_file: public_member_api_docs, sort_constructors_first


sealed class HubContentsClassEvent {}

class GetHubContentsEvent extends HubContentsClassEvent {
int hubId;
String categoryName;
  GetHubContentsEvent(
     this.hubId,
     this.categoryName,
  );

}

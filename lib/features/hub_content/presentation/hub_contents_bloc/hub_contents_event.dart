// ignore_for_file: public_member_api_docs, sort_constructors_first


sealed class HubContentsClassEvent {}

class getHubContentsEvent extends HubContentsClassEvent {
int hubId;
String bicycleCategory;
  getHubContentsEvent(
     this.hubId,
     this.bicycleCategory,
  );

}

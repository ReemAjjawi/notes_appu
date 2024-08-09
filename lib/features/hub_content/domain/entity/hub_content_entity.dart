
import '../../data/model/second_model.dart';

class HubContentEntity{
    int? id;
    int? hubId;
    List<BicycleListModel> bicycleList;
    String note;

    HubContentEntity({
        required this.id,
        required this.hubId,
        required this.bicycleList,
        required this.note,
    });}


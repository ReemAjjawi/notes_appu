import 'dart:convert';
import '../../domain/entity/hub_content_entity.dart';
import 'second_model.dart';

HubContentModel hubContentModelFromJson(String str) => HubContentModel.fromJson(json.decode(str));

String hubContentModelToJson(HubContentModel data) => json.encode(data.toJson());
   class HubContentModel extends HubContentEntity{
   HubContentModel  ({
        required super.id,
        required super.hubId,
        required super.bicycleList,
        required super.note,
    });

    factory HubContentModel.fromJson(Map<String, dynamic> json) => HubContentModel(
        id: json["id"],
        hubId: json["hubId"],
        bicycleList: List<BicycleListModel>.from(json["bicycleList"].map((x) => BicycleListModel.fromJson(x))),
        note: json["note"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hubId": hubId,
        "bicycleList": List<dynamic>.from(bicycleList.map((x) => x.toJson())),
        "note": note,
    };
}


// To parse this JSON data, do
//
//     final bicycleModel = bicycleModelFromJson(jsonString);

import 'dart:convert';

import 'package:ride_application/features/categories/domain/entity/bicycle_entity.dart';

// BicycleModel bicycleModelFromJson(String str) => BicycleModel.fromJson(json.decode(str));

// String bicycleModelToJson(BicycleModel data) => json.encode(data.toJson());

// class BicycleModel {
//     List<Body> body;

//     BicycleModel({
//         required this.body,
//     });

//     factory BicycleModel.fromJson(Map<String, dynamic> json) => BicycleModel(
//         body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "body": List<dynamic>.from(body.map((x) => x.toJson())),
//     };
// }


class ModelPriceModel extends ModelPriceEntity {
 
    ModelPriceModel({
        required super.id,
        required super.price,
        required super.model,
    });

    factory ModelPriceModel.fromJson(Map<String, dynamic> json) => ModelPriceModel(
        id: json["id"],
        price: json["price"],
        model: json["model"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "model": model,
    };
}

class BicycleModel extends BicycleEntity{
    
    BicycleModel({
        required super.id,
        required super.modelPrice,
        required super.size,
        required super.photoPath,
        required super.type,
        required super.note,
        required super.maintenance,
    });

    factory BicycleModel.fromJson(Map<String, dynamic> json) => BicycleModel(
        id: json["id"],
        modelPrice: ModelPriceModel.fromJson(json["model_price"]),
        size: json["size"],
        photoPath: json["photoPath"],
        type: json["type"],
        note: json["note"],
        maintenance: List<dynamic>.from(json["maintenance"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "model_price": modelPrice.toJson(),
        "size": size,
        "photoPath": photoPath,
        "type": type,
        "note": note,
        "maintenance": List<dynamic>.from(maintenance.map((x) => x)),
    };
}



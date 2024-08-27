class BicycleListModel {
  int id;
  ModelPriceModel modelPrice;
  String type;
  int size;
  String note;
  List<dynamic> maintenance;
  List<dynamic> extension;
  int photoId;
  dynamic hasOffer;
  dynamic discountPrice;

  BicycleListModel({
    required this.id,
    required this.modelPrice,
    required this.type,
    required this.size,
    required this.note,
    required this.maintenance,
    required this.extension,
    required this.photoId,
    required this.hasOffer,
    required this.discountPrice,
  });

  factory BicycleListModel.fromJson(Map<String, dynamic> json) =>
      BicycleListModel(
        id: json["id"],
        modelPrice: ModelPriceModel.fromJson(json["model_price"]),
        type: json["type"],
        size: json["size"],
        note: json["note"],
        maintenance: List<dynamic>.from(json["maintenance"].map((x) => x)),
        extension: List<dynamic>.from(json["extension"].map((x) => x)),
        photoId: json["photo_id"],
        hasOffer: json["hasOffer"],
        discountPrice: json["discountPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_price": modelPrice.toJson(),
        "type": type,
        "size": size,
        "note": note,
        "maintenance": List<dynamic>.from(maintenance.map((x) => x)),
        "extension": List<dynamic>.from(extension.map((x) => x)),
        "photo_id": photoId,
        "hasOffer": hasOffer,
        "discountPrice": discountPrice,
      };
}

class ModelPriceModel {
  int id;
  double price;
  String model;

  ModelPriceModel({
    required this.id,
    required this.price,
    required this.model,
  });

  factory ModelPriceModel.fromJson(Map<String, dynamic> json) =>
      ModelPriceModel(
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

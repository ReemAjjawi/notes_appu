
import 'package:ride_application/features/categories/data/model/bicycle_model.dart';

class BicycleEntity {
    int id;
    ModelPriceModel modelPrice;
    int size;
    String photoPath;
    String type;
    String note;
    List<dynamic> maintenance;

    BicycleEntity({
        required this.id,
        required this.modelPrice,
        required this.size,
        required this.photoPath,
        required this.type,
        required this.note,
        required this.maintenance,
    });

}

class ModelPriceEntity {
    int id;
    double price;
    String model;

    ModelPriceEntity({
        required this.id,
        required this.price,
        required this.model,
    });

 
}

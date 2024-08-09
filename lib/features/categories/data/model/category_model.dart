import '../../domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity{


  CategoryModel({required super.name});

  factory CategoryModel.fromJson(String json) {
    return CategoryModel(name: json);
  }
}


// import 'dart:convert';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:hive/hive.dart';

// import 'package:ride_application/features/Auth/data/model/article_model.dart';

// import '../../../../../config/app_url.dart';
// import '../../../../../core/error/exceptions.dart';
// import '../../../../../core/service.dart';
// import '../../../../../core/success/success.dart';

// class getAllHubs{

// }
// abstract class getCategoriesService{
// getCategories();
// getBicyclesByCategory();
// }

// class getCategoriesServiceImp implements getCategoriesService {
// Dio dio;
//   getCategoriesServiceImp({
//     required this.dio,
//   });

 
//   @override
//   getBicyclesByCategory() {
//     Future<Success> Register(UserModel user) async {
//     print(user.toMap());
//     print('${AppUrl.baseUrl}/${AppUrl.signUp}');
//     final _data = user.toMap();
//     Response response = await dio.post('${AppUrl.baseUrl}/${AppUrl.signUp}',
//         data: user.toJson());
//     print('${AppUrl.baseUrl}/${AppUrl.signUp}');

//     if (response.statusCode == 200) {
//       print(response.data);

//       String token = response.data['body']['token'];
//       var box = Hive.box('projectBox');

//       box.put('token', token);

//       return  DataSuccess();
//     } else if(response.statusCode == 403 && response.data['message']){
//       print(response.data['message']);
//       throw PasswordExcetion(response.data['message']);
//     }
//     else{
//       throw UserNameExcetion();
//     }
//   }
//    }
  
//   @override
//   getCategories() {
//     // TODO: implement getCategories
//     throw UnimplementedError();
//   }
// }

// import 'package:bloc_pattern/model/animal_model.dart';
// import 'package:bloc_pattern/model/handling.dart';
// import 'package:dio/dio.dart';

// abstract class Service {
//   Dio dio = Dio();
//   late Response response;
// }

// abstract class AnimalService extends Service {
//   String baseurl = "https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/Animal";

//   Future<ResultModel> getAnimal();
//   Future<ResultModel> createNewAniml(String name);
// }

// class AnimalServiceImp extends AnimalService {
//   @override
//   Future<ResultModel> getAnimal() async {
//     try {
//       response = await dio.get(baseurl);

//       List<AnimalModel> animals = List.generate(
//         response.data.length,
//         (index) => AnimalModel.fromMap(response.data[index]),
//       );
//       return ListOf(data: animals);
//     } catch (e) {
//       return ExceptionModel();
//     }
//   }

//   @override
//   Future<ResultModel> createNewAniml(String name) async {
//     try {
//       response = await dio.post(baseurl, data: {"name": name});
//       AnimalModel animalModel = AnimalModel.fromMap(response.data);
//       return animalModel;
//     } catch (e) {
//       print(e);
//       return ExceptionModel();
//     }
//   }
// }
// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:ride_application/features/categories/data/datasource/remote/categories_service.dart';
// import 'package:ride_application/features/categories/presentation/view/bicycles_screen.dart';
// import 'package:ride_application/features/categories/presentation/view/categories_screen.dart';

// import 'package:ride_application/main.dart';

// void main() {
//     group("Test Service ", () {
//       late BicycleServiceimpl categoriesServiceImp;
//       late Dio dio;
//       late String category ="ride";

//       setUp(() {
//         dio = Dio();
//         authService = AuthService(dio: dio);
//         user = UserModel(
//             firstName: "firstName",
//             lastName: "lastName",
//             phone: "phone",
//             username: "usernme",
//             birthDate: "2022-07-08",
//             password: "password",
//             confirmPassword: "password");
//       });

//       test("InValid Password", () async {
//         try {
//           var data = await authService.signUp(user);
//         } catch (e) {
//           print(e.runtimeType);
//           expect(e, throwsA(PasswordMustContainOneUppercase()));
//         }
//       });
//     });
// }

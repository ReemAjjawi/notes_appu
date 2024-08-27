import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ride_application/core/error/exceptions.dart';
import 'package:ride_application/core/error/failures.dart';
import 'package:ride_application/core/success/success.dart';
import 'package:ride_application/features/authation/data/datasource/remote/register_service.dart';
import 'package:ride_application/features/authation/data/model/user_model.dart';
import 'package:ride_application/features/authation/data/repository/register_repository_impl.dart';
import 'servies.dart';

void main() {
  group("Test Service ", () {
    late AuthServiceImp authService;
    late Dio dio;
    late UserModel user;

    setUp(() {
      dio = Dio();
      authService = AuthServiceImp(dio: dio);
      user = UserModel(
          firstName: "firstName",
          lastName: "lastName",
          phone: "phone",
          username: "usernme",
          birthDate: "2022-07-08",
          password: "password",
          confirmPassword: "password");
    });

    test("InValid Password", () async {
      expect(
        () async => await authService.Register(user),
        throwsA(isA<PasswordMustContainOneUppercase>()),
      );
    });
  });

  group("testing for success ", () {
    late AuthServiceImp authService;
    late Dio dio;
    late UserModel user;

    setUp(() async {
      dio = Dio();
      authService = AuthServiceImp(dio: dio);
//await Hive.initFlutter();
      //await Hive.openBox('projectBox');
      user = UserModel(
          firstName: "firstName",
          lastName: "lastName",
          phone: "0933457677",
          username: "reeno",
          birthDate: "2022-07-08",
          password: "kjhgfds567SSA*&^",
          confirmPassword: "password");
    });

    test("Right Password", () async {
      final result = await authService.Register(user);
      expect(result, isA<SuccessSituation>());
    });
  });
  group("Test Repo", () {
    late Dio dio;
    late UserModel user;
    late AuthServiceImp authService;
    late RegisterRepoImpl repo;

    setUp(() {
      user = UserModel(
          firstName: "firstName",
          lastName: "lastName",
          phone: "phone",
          username: "usernme",
          birthDate: "2022-07-08",
          password: "password",
          confirmPassword: "password");
      dio = Dio();
      authService = AuthServiceImp(dio: dio);
      repo = RegisterRepoImpl(authServiceImp: authService);
    });

    test("Password Must Contain and return PasswordFailure", () async {
      var data = await repo.Register(user);
      expect(data.fold((l) => l, (r) => null), isA<PasswordFailure>());
    });
  });

  group("Test Service of bicycle", () {
    late CategoriesServiceImp categoriesServiceImp;
    late Dio dio;

    setUp(() {
      dio = Dio();
      categoriesServiceImp = CategoriesServiceImp(dio: dio);
    });
    test("InValid category", () async {
      try {
        String category = "Road_bike";
        await categoriesServiceImp.getBicyclesByCategory(category);
        fail('Expected an exception to be thrown');
      } catch (e) {
        expect(e, isA<ServerException>());
        // expect((e as PasswordMustContainOneUppercase).message,
        //     "Password must contain 1 or more uppercase characters.");
      }
    });
  });
}

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

String nam =
    "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1NTU1NTU1NTU1IiwiaWF0IjoxNzIzMjQxMTg4LCJleHAiOjE3MjMzMjc1ODh9.MF4OA30QCETnzt60VxZD3Ft8X0kPsd7GB6U20yzGwjo";

class HeaderConfig {
  static Options getHeader({useToken = true}) {
    var box = Hive.box('projectBox');
    // box.get('token')
    if (useToken) {
      return Options(
        headers: {"accept": "*/*", "Authorization": "Bearer ${(nam)}"},
      );
    } else {
      return Options(
        headers: {
          "Content-Type": "application/json",
        },
      );
    }
  }
}

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

String nam =
    "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMjIyMjIyMjI0IiwiaWF0IjoxNzIzODM2MTY4LCJleHAiOjE3MjM5MjI1Njh9.-H2F76cAkqnhZBIVIzK8KiLZDfOFB6HryzpV8_nj-_w";

// box.get('token')
class HeaderConfig {
  static Options getHeader({useToken = true}) {
    var box = Hive.box('projectBox');
    //box.get('token')
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

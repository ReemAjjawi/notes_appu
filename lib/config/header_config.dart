import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

String nam =
    "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1MTI1NTY4ODk5IiwiaWF0IjoxNzI0NzY1NzQ1LCJleHAiOjE3MjQ4NTIxNDV9.zAzumfY6oICQ8GSprzYYgeVH1BnmvYGRsh1BW0uTHUs";

// box.get('token')
class HeaderConfig {
  static Options getHeader({useToken = true}) {
    var box = Hive.box('projectBox');
    //
    if (useToken) {
      return Options(
        headers: {
          "accept": "*/*",
          "Authorization": "Bearer ${box.get('token')}"
        },
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

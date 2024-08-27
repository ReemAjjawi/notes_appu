import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

String nam =
    "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTc0Mzk3NjU2IiwiaWF0IjoxNzI0NDgwNTA4LCJleHAiOjE3MjQ1NjY5MDh9.Ek1DP63sWdiDwlu09vjEC8JY6TER3tOTip25XbS__54";

// box.get('token')
class HeaderConfig {
  static Options getHeader({useToken = true}) {
    var box = Hive.box('projectBox');
    //
    if (useToken) {
      return Options(
        headers: {
          "accept": "*/*",
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwMzI4MjkxNzU2IiwiaWF0IjoxNzI0Njk4Mzc1LCJleHAiOjE3MjQ3ODQ3NzV9.QJRGEpEj23MkV3laOv6w3SflUXibqQ38Oz1DzscoJGw"
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

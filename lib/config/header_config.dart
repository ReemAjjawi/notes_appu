import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

String nam =
    "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwMzIyNTY0ODg2IiwiaWF0IjoxNzIzNzA5OTQ0LCJleHAiOjE3MjM3OTYzNDR9.bDJvcBt8ZZGOqskrkAOBfk2Dy5KqtFQaG-K6fM8-z7M";

// box.get('token')
class HeaderConfig {
  static Options getHeader({useToken = true}) {
    var box = Hive.box('projectBox');
    //
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

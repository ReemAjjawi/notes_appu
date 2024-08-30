import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

String nam =
    "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1NDQ1NTU0NTQ1IiwiaWF0IjoxNzI1MDMzNDUxLCJleHAiOjE3MjUxMTk4NTF9.JO68zfjJpwwClNDdTR3OMbHRpH4FZdZwMlrZ3HerWD4";

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

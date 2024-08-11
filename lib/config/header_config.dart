import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

String nam =
    "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMTU0NTk4Nzc1IiwiaWF0IjoxNzIzMzk5MDY5LCJleHAiOjE3MjM0ODU0Njl9.B_7RKvrK1mAih6hVIQEWDFg0xo8_05xb_bgIL9htXTg";

class HeaderConfig {
  static Options getHeader({useToken = true}) {
    var box = Hive.box('projectBox');
    // box.get('token')
    if (useToken) {
      return Options(
        headers: {
          "accept": "*/*",
          "Authorization": "Bearer ${(box.get('token'))}"
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

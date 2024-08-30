import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

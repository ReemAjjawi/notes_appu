import 'package:dio/dio.dart';

class HeaderConfig {
  static Options getHeader({useToken = true}) {
    if (useToken) {
      return Options(
        headers: {
          "accept": "*/*",
          "Authorization": "Bearer ${(
            // core.get<SharedPreferences>().getString(
            //       'token',
            //     ),
          )}"
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
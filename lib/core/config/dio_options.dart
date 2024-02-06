import 'package:dio/dio.dart';

import '../constants/app_urls.dart';

class DioConfigOptions {
  static Future<BaseOptions> getBaseOption() async {
    BaseOptions options = BaseOptions(
        baseUrl: AppUrl.baseUrl,
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    return options;
  }
}

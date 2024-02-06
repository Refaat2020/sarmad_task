import 'package:dio/dio.dart';
import 'package:sarmad_task/core/extensions/response_methods.dart';

import '../../common/model/failure_model.dart';
import '../config/dio_options.dart';

class DioServices {
  Dio dio = Dio();

  /*
   * Post Request Function
   */
  Future<dynamic> postRequest(
    Map<String, dynamic>? body,
    String? apiUrl,
  ) async {
    try {
      dio.options = await DioConfigOptions.getBaseOption();
      Response response = await dio.post(apiUrl!, data: body);
      return response.handleResponse();
    } catch (e) {
      if (e is DioException) {
        throw FailureModel(
            message: e.handleDioException(e.type), state: 0, data: "data");
      }
      throw Exception(e);
    }
  }
}

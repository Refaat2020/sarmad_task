import '../../../../../common/model/failure_model.dart';
import '../../../../../core/constants/app_urls.dart';
import '../../../../../core/services/dio_services.dart';

class LandingDataSource {
  final DioServices _dioServices;

  LandingDataSource(this._dioServices);

  Future<Map<String, dynamic>> getIndividual(
      Map<String, dynamic> searchIndividualBody) async {
    try {
      var response = await _dioServices.postRequest(
          searchIndividualBody, AppUrl.individualPath);
      return response;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }
}

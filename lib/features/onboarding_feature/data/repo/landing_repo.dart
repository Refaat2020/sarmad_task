import '../../../../common/model/failure_model.dart';
import '../data_soure/remote_data_source/landing_data_source.dart';
import '../models/user_individual_model.dart';

class LandingRepo {
  final LandingDataSource _landingDataSource;

  LandingRepo(this._landingDataSource);

  Future<List<UserIndividualModel>> getIndividual(
      UserIndividualModel individualModel) async {
    try {
      var response =
          await _landingDataSource.getIndividual(individualModel.toMap());
      List<UserIndividualModel> listOfUser = List<UserIndividualModel>.from(
          (response["screen_result"])
              .map((x) => UserIndividualModel.fromMap(x)));
      return listOfUser;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }
}

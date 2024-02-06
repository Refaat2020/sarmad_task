import 'package:sarmad_task/features/onboarding_feature/data/repo/landing_repo.dart';

import '../../../../common/model/failure_model.dart';
import '../../data/models/user_individual_model.dart';

class LandingUseCase {
  final LandingRepo _landingRepo;

  LandingUseCase(this._landingRepo);

  Future<List<UserIndividualModel>> searchForIndividual(
      UserIndividualModel individualModel) async {
    try {
      var response = await _landingRepo.getIndividual(individualModel);
      return response;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }
}

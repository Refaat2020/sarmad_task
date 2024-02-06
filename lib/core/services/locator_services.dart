import 'package:get_it/get_it.dart';
import 'package:sarmad_task/features/onboarding_feature/data/data_soure/remote_data_source/landing_data_source.dart';
import 'package:sarmad_task/features/onboarding_feature/data/repo/landing_repo.dart';
import 'package:sarmad_task/features/onboarding_feature/domain/use_case/landing_use_case.dart';

import 'dio_services.dart';

final locator = GetIt.instance;

///how to take object from class in service locator
/// Repo repo = locator<Repo>();
void setupLocator() {
  locator.registerLazySingleton(() => DioServices());
  locator
      .registerLazySingleton(() => LandingDataSource(locator<DioServices>()));
  locator
      .registerLazySingleton(() => LandingRepo(locator<LandingDataSource>()));
  locator.registerLazySingleton(() => LandingUseCase(locator<LandingRepo>()));
}

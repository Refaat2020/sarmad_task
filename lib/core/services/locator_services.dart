import 'package:get_it/get_it.dart';
import 'package:sarmad_task/features/onboarding_feature/data/data_soure/remote_data_source/landing_data_source.dart';
import 'package:sarmad_task/features/onboarding_feature/data/repo/landing_repo.dart';

import 'dio_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DioServices());
  locator
      .registerLazySingleton(() => LandingDataSource(locator<DioServices>()));
  locator
      .registerLazySingleton(() => LandingRepo(locator<LandingDataSource>()));
}

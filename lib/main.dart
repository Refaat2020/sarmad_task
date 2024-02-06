import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarmad_task/features/onboarding_feature/domain/use_case/landing_use_case.dart';

import 'core/config/app_route.dart';
import 'core/config/observer.dart';
import 'core/constants/app_theme.dart';
import 'core/services/locator_services.dart';
import 'features/onboarding_feature/domain/cubit/landing_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();
  setupLocator();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LandingCubit>(
      create: (context) => LandingCubit(locator<LandingUseCase>()),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp.router(
            routerConfig: AppRouter.route,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: AppTheme.appTheme,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.noScaling,
                ),
                child: child!,
              );
            },
          ),
        );
      },
    );
  }
}

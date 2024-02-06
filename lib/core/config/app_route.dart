import 'package:sarmad_task/features/onboarding_feature/views/search_screen/search_screen.dart';

import '../../features/onboarding_feature/views/landing_screen/landing_screen.dart';
import '../../features/onboarding_feature/views/splash_screen/splash_screen.dart';
import '../../file_export.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final route = GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          path: SplashScreen.route,
          name: SplashScreen.route,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: SearchScreen.route,
          name: SearchScreen.route,
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: LandingScreen.route,
          name: LandingScreen.route,
          builder: (context, state) => const LandingScreen(),
        ),
      ]);
}

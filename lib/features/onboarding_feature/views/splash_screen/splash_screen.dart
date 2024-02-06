import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarmad_task/core/constants/app_colors.dart';
import 'package:sarmad_task/features/onboarding_feature/views/search_screen/search_screen.dart';

class SplashScreen extends StatefulWidget {
  static const route = "/";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(
        milliseconds: 900,
      ),
      () => GoRouter.of(context).go(SearchScreen.route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "Sarmad",
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(color: AppColors.green1),
      ),
    ));
  }
}

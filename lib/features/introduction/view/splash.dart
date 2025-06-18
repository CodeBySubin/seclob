import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seclob/core/constants/app_color.dart';
import 'package:seclob/core/constants/app_image.dart';
import 'package:seclob/core/routes/app_routes.dart';
import 'package:seclob/core/utils/storage_helper.dart';
import 'package:seclob/features/introduction/view_model/view_model.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    final viewModel = IntroductionViewModel();

    Future.microtask(() async {
      viewModel.spashNavigation(() async {
        final token = await SecureStorageHelper.getToken();
        final isOnboardingSeen = await SecureStorageHelper.isOnboardingSeen();

        if (!mounted) return;

        if (!isOnboardingSeen) {
          context.go(AppRoutes.onboarding); // First-time users
        } else if (token != null && token.isNotEmpty) {
          context.go(AppRoutes.home); // Authenticated users
        } else {
          context.go(AppRoutes.login); // No token
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(AppImage.splash, fit: BoxFit.cover),
      ),
    );
  }
}

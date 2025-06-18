import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    final viewModel = IntroductionViewModel();
    viewModel.spashNavigation(() async {
      context.go(AppRoutes.onboarding);
      final token = await SecureStorageHelper.getToken();
      if (!mounted) return;
      if (token != null && token.isNotEmpty) {
        context.go(AppRoutes.home);
      } else {
        context.go(AppRoutes.onboarding);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Image.asset(AppImage.splash, fit: BoxFit.cover),
      ),
    );
  }
}

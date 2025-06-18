import 'package:seclob/features/authentication/presentation/view/login.dart';
import 'package:seclob/features/home/presentation/view/home.dart';
import 'package:seclob/features/introduction/view/onboarding.dart';
import 'app_routes.dart';
import 'package:go_router/go_router.dart';

import '../../features/introduction/view/splash.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: RouteNames.splash,
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        name: RouteNames.onboarding,
        builder: (context, state) => const Onboardings(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: RouteNames.home,
        builder: (context, state) => const Home(),
      ),

      //Authentication
      GoRoute(
        path: AppRoutes.login,
        name: RouteNames.login,
        builder: (context, state) => const Login(),
      ),
      //     GoRoute(
      //       path: AppRoutes.register,
      //       name: RouteNames.register,
      //       builder: (context, state) => const Register(),
      //     ),
      //     GoRoute(
      //       path: AppRoutes.fingerPrint,
      //       name: RouteNames.fingerPrint,
      //       builder: (context, state) => const FingerPrints(),
      //     ),
      //     GoRoute(
      //       path: AppRoutes.otp,
      //       name: RouteNames.otp,
      //    builder: (context, state) {
      //   final authUser = state.extra as AuthUser;
      //   return Otp(user: authUser);
      // },
      //     ),
      // GoRoute(
      //   path: '${AppRoutes.productDetail}/:id',
      //   name: RouteNames.productDetail,
      //   builder: (context, state) {
      //     final id = state.pathParameters['id']!;
      //     return ProductDetailPage(productId: id);
      //   },
      // ),
    ],
  );
}

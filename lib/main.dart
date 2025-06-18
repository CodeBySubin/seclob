import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:seclob/core/constants/app_strings.dart';
import 'package:seclob/core/routes/route_genarator.dart';
import 'package:seclob/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:seclob/features/profile/presentation/viewmodel/profile_viewmodel.dart';
import 'package:seclob/injection/injection.dart';
import 'package:seclob/features/authentication/presentation/viewmodel/login_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginViewModel>(
            create: (_) => getIt<LoginViewModel>(),
          ),
          ChangeNotifierProvider<HomeViewModel>(
            create: (_) => getIt<HomeViewModel>(),
          ),
           ChangeNotifierProvider<ProfileViewModel>(
            create: (_) => getIt<ProfileViewModel>(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          routerConfig: AppRouter.router,
          theme: ThemeData(fontFamily: "SFPro"),
        ),
      ),
    );
  }
}

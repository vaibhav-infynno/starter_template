import 'package:auto_route/auto_route.dart';
import 'package:starter_app/core/routes/auth_guard.dart';

import '../../features/auth/screens/login/ui/login_page.dart';
import '../../features/onboarding/no_internet_screen.dart';
import '../../features/onboarding/onboarding_page.dart';
import '../../features/splash/screens/ui/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({required this.authGuard});
  final AuthGuard authGuard;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: NoInternetRoute.page),
  ];
}

import 'package:auto_route/auto_route.dart';

import '../../features/auth/screens/login/ui/login_page.dart';
import '../../features/onboarding/onboarding_page.dart';
import '../../features/splash/screens/ui/splash_screen.dart';
import 'auth_guard.dart';

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
  ];
}

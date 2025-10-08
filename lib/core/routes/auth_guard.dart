import 'package:auto_route/auto_route.dart';

import '../utils/preference_utils.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final token = getString('accessToken');

    if (token.isNotEmpty) {
      resolver.next(); // User is authenticated, allow navigation
    } else {
      // router.replace(LoginRoute()); // Or push(LoginRoute()) if needed
    }
  }
}

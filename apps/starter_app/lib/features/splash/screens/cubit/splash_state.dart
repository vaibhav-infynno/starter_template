part of 'splash_cubit.dart';

enum TokenStatus { valid, invalid, error, init }

abstract class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashNavigate extends SplashState {
  final PageRouteInfo route;
  const SplashNavigate(this.route);
}

class SplashError extends SplashState {
  final Failure failure;
  const SplashError(this.failure);
}

class SplashNoInternet extends SplashState {
  const SplashNoInternet();
}

class SplashChecking extends SplashState {
  const SplashChecking();
}

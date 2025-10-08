import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/preference_utils.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../../cubit/internet/internet_cubit.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/splash_cubit.dart';

@RoutePage()
class SplashPage extends StatefulWidget implements AutoRouteWrapper {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();

  /// ✅ Wrap with BlocProvider instead of ChangeNotifierProvider
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(
        sl.get(),
        context.read<InternetCubit>(),
      ), // inject your SplashRepository via sl()
      child: this,
    );
  }
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        final isOnboarded = getBool('isOnboarded');
        if (!isOnboarded) {
          context.router.replaceAll([const OnboardingRoute()]);
          return;
        } else if (state is SplashNavigate) {
          context.router.replaceAll([state.route]);
        } else if (state is SplashError) {
          state.failure.type == FailureType.network
              ? showFlushbar(
                  context: context,
                  message: 'No Internet Connection',
                )
              : showFlushbar(context: context, message: state.failure.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
        body: SafeArea(
          child: Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SvgPicture.asset(Assets.logo.splashIcon),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/preference_utils.dart';
import '../../../../cubit/internet/internet_cubit.dart';
import '../../repositories/splash_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashRepository _splashRepository;
  final InternetCubit _internetCubit;
  late final StreamSubscription internetSub;

  SplashCubit(this._splashRepository, this._internetCubit)
    : super(SplashInitial()) {
    // Start listening to internet status
    internetSub = _internetCubit.stream.listen((status) {
      final connectivity = _internetCubit.state.type;
      if (connectivity != ConnectivityResult.none) {
        _onInternetRestored();
      }
    });

    _startAppFlow();
  }

  Future<void> _startAppFlow() async {
    final connectivity = _internetCubit.state.type;
    if (connectivity == ConnectivityResult.none) {
      emit(SplashNoInternet());
      return;
    }
  }

  Future<void> _onInternetRestored() async {
    emit(SplashChecking());

    await Future.delayed(const Duration(milliseconds: 300));

    final tokenStatus = await validateToken();

    switch (tokenStatus) {
      case TokenStatus.valid:
        log('✅ Token valid after internet restore — go to Dashboard');
        emit(SplashNavigate(const OnboardingRoute()));
        break;

      case TokenStatus.invalid:
      case TokenStatus.init:
        log('⚠️ Token invalid/init after restore — go to Login');
        emit(SplashNavigate(const LoginRoute()));
        break;

      case TokenStatus.error:
        log(
          '🚨 Token validation error after restore — show no internet or stay',
        );
        emit(SplashError(Failure(type: FailureType.network)));
        break;
    }
  }

  Future<void> initialize(BuildContext context) async {
    emit(SplashLoading());
    try {
      final tokenStatus = await validateToken();

      switch (tokenStatus) {
        case TokenStatus.valid:
          _navigateToDashboard(context);
          break;
        case TokenStatus.invalid:
        case TokenStatus.init:
          _navigateToLogin(context);
          break;
        case TokenStatus.error:
          _navigateToLogin(context);
          break;
      }
    } catch (e, st) {
      log('Splash initialization failed: $e\n$st');
      emit(SplashError(FailureMapper.mapException(e)));
    }
  }

  /// ✅ Validate token using repository
  Future<TokenStatus> validateToken() async {
    emit(const SplashLoading());

    final isConnected = _internetCubit.state.isConnected;
    if (!isConnected) {
      return TokenStatus.error;
    }
    try {
      final token = getString('refreshToken');
      if (token.isEmpty) {
        log('No token found, navigating to Login');
        return TokenStatus.init;
      }

      final result = await _splashRepository.validateToken(token: token);

      return result.fold(
        (failure) {
          if (failure.type == FailureType.authentication) {
            _clearTokens();
            return TokenStatus.invalid;
          } else if (failure.type == FailureType.network) {
            return TokenStatus.error;
          } else if (failure.type == FailureType.init) {
            return TokenStatus.init;
          } else {
            return TokenStatus.error;
          }
        },
        (_) {
          log('✅ Token valid');
          return TokenStatus.valid;
        },
      );
    } catch (e) {
      log('validateToken error: $e');
      return TokenStatus.error;
    }
  }

  void _navigateToDashboard(BuildContext context) {
    emit(SplashNavigate(const OnboardingRoute()));
    context.router.replaceAll([const OnboardingRoute()]);
  }

  void _navigateToLogin(BuildContext context) {
    emit(SplashNavigate(const LoginRoute()));
    context.router.replaceAll([const LoginRoute()]);
  }

  Future<void> _clearTokens() async {
    await Future.wait([
      setString('accessToken', ''),
      setString('refreshToken', ''),
      setString('businessDetailsToken', ''),
      setString('businessName', ''),
    ]);
  }

  @override
  Future<void> close() {
    internetSub.cancel();
    return super.close();
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/core/routes/app_router.dart';
import 'package:starter_app/core/utils/show_snackbar.dart';

import '../../cubit/internet_cubit.dart';

class GlobalConnectivityObserver extends NavigatorObserver {
  final InternetCubit internetCubit;
  bool _isOfflineScreenVisible = false;

  GlobalConnectivityObserver(this.internetCubit) {
    internetCubit.stream.listen((state) {
      final nav = navigator;
      if (nav == null) return;
      final context = nav.context;

      if (!state.isConnected && !_isOfflineScreenVisible) {
        _isOfflineScreenVisible = true;
        context.router.push(const NoInternetRoute());
      } else if (state.isConnected && _isOfflineScreenVisible) {
        _isOfflineScreenVisible = false;

        // Safely pop only if NoInternetRoute is on top
        final topRoute = context.router.topRoute.name;
        if (topRoute == NoInternetRoute.name) {
          nav.pop();
        }

        showFlushbar(context: context, message: 'Back Online', isError: false);
      }
    });
  }
}

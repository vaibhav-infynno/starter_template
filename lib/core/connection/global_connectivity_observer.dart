import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:starter_app/core/helpers/extensions/responsive_extensions.dart';
import 'package:starter_app/cubit/theme_cubit.dart';

import '../../cubit/internet/internet_cubit.dart';
import '../../gen/assets.gen.dart';
import '../utils/show_snackbar.dart';

class GlobalConnectivityObserver extends NavigatorObserver {
  final InternetCubit internetCubit;
  bool _isDialogVisible = false;

  GlobalConnectivityObserver(this.internetCubit) {
    internetCubit.stream.listen((state) async {
      final nav = navigator;
      if (nav == null) return;
      final context = nav.context;

      if (!state.isConnected && !_isDialogVisible) {
        _isDialogVisible = true;
        _showNoInternetDialog(context);
      } else if (state.isConnected && _isDialogVisible) {
        _isDialogVisible = false;

        // Close the dialog safely if it’s still open
        // if (Navigator.of(context, rootNavigator: true).canPop()) {
        //   Navigator.of(context, rootNavigator: true).pop();
        // }

        if (context.router.canPop()) {
          context.router.pop();
        }

        showFlushbar(context: context, message: 'Back Online', isError: false);
      }
    });
  }

  void _showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 32),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Optionally use a Lottie animation if available
                Lottie.asset(
                  Assets.lottie.noInternet,
                  height: 120,
                  repeat: true,
                ),
                const SizedBox(height: 16),
                context.autoSizeText(
                  text: "No Internet Connection",
                  style: context.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                context.autoSizeText(
                  text: "Please check your network settings and try again.",
                  style: context.textTheme.bodyMedium!,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    // Optionally trigger connectivity check manually
                    internetCubit.checkConnectivity();
                    // If still offline, keep the dialog open
                    showFlushbar(
                      context: context,
                      message: 'Still offline. Please reconnect.',
                      isError: true,
                    );
                  },
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

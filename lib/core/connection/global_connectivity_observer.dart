import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:starter_app/core/utils/show_snackbar.dart';
import 'package:starter_app/gen/assets.gen.dart';

import '../../cubit/internet/internet_cubit.dart';

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
        if (Navigator.of(context, rootNavigator: true).canPop()) {
          Navigator.of(context, rootNavigator: true).pop();
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
                Text(
                  "No Internet Connection",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "Please check your network settings and try again.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    // Optionally trigger connectivity check manually
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

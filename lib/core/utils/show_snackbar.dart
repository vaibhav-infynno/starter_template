import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/cubit/theme_cubit.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(content)));
}

void showErrorSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(content), backgroundColor: Colors.red),
    );
}

void showFlushbar({
  required BuildContext context,
  required String message,
  bool isError = true,
}) {
  if (!context.mounted) return;
  Flushbar(
    message: message,
    backgroundColor: isError ? context.colors.error : context.colors.success,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
    flushbarPosition: FlushbarPosition.TOP,
    icon: Icon(
      isError ? Icons.error_outline : Icons.check_circle_outline,
      color: Colors.white,
    ),
  ).show(context);
}

void showCopiedToast(
  BuildContext context, {
  String message = "Copied to clipboard",
}) {
  final overlay = Overlay.of(context);

  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 60,
      left: MediaQuery.of(context).size.width * 0.2,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: context.colors.surface900.withOpacity(0.9),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(message, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}

import 'package:flutter/material.dart';

import '../error/failures.dart';
import 'show_snackbar.dart';

void handleFailure(BuildContext context, Failure failure) {
  if (!context.mounted) return;
  String message;
  switch (failure.type) {
    case FailureType.network:
      message =
          'No internet connection. Please check your network and try again.';
      break;
    case FailureType.authentication:
      message = 'Session expired. Please log in again.';
      break;
    case FailureType.validation:
      message = failure.message.isNotEmpty
          ? failure.message
          : 'Invalid input provided.';
      break;
    case FailureType.server:
      message = 'Server error: ${failure.message}';
      break;
    case FailureType.init:
      message = 'Initialization failed. Please try again.';
      break;
    default:
      message = failure.message.isNotEmpty
          ? failure.message
          : 'An unexpected error occurred.';
  }
  showFlushbar(context: context, message: message, isError: true);
}

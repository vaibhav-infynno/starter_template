enum FailureType { server, network, authentication, validation, unknown, init }

class Failure {
  final FailureType type;
  final String message;
  final int? statusCode;

  Failure({
    this.type = FailureType.unknown,
    this.message = 'An unexpected error occurred.',
    this.statusCode,
  });

  factory Failure.fromServerError(dynamic error, [int? statusCode]) {
    String message = 'An unexpected server error occurred.';
    FailureType type = FailureType.server;

    // Handle both raw string and JSON map cases
    if (error is String && error.trim().isNotEmpty) {
      message = error;
    } else if (error is Map<String, dynamic>) {
      message =
          error['message']?.toString() ??
          error['error_description']?.toString() ??
          error['error']?.toString() ??
          message;
    }

    // Map status code to FailureType
    if (statusCode != null) {
      if (statusCode == 401 || statusCode == 403) {
        type = FailureType.authentication;
      } else if (statusCode == 400 &&
          message.contains("Invalid or expired token")) {
        // Treat invalid/expired token as authentication issue
        type = FailureType.authentication;
      } else if (statusCode == 400 && message.contains('Token is required')) {
        type = FailureType.init;
      } else if (statusCode == 400) {
        type = FailureType.validation;
      } else if (statusCode >= 500) {
        type = FailureType.server;
      }
    }

    return Failure(type: type, message: message, statusCode: statusCode);
  }

  // Factory constructor for network errors
  factory Failure.networkError() {
    return Failure(
      type: FailureType.network,
      message:
          'No internet connection. Please check your network and try again.',
    );
  }

  // Factory constructor for authentication errors
  factory Failure.authenticationError([String? message]) {
    return Failure(
      type: FailureType.authentication,
      message:
          message ?? 'Authentication failed. Please check your credentials.',
    );
  }

  // Factory constructor for validation errors
  factory Failure.validationError([String? message]) {
    return Failure(
      type: FailureType.validation,
      message: message ?? 'Invalid input. Please check your data.',
    );
  }

  @override
  String toString() {
    return 'Failure(type: $type, message: $message, statusCode: $statusCode)';
  }
}

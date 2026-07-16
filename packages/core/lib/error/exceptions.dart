import 'failures.dart';

abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(this.message, [this.statusCode]);

  Failure toFailure();

  @override
  String toString() =>
      '$runtimeType(message: $message, statusCode: $statusCode)';
}

class ServerException extends AppException {
  const ServerException(super.message, [super.statusCode]);

  @override
  Failure toFailure() => Failure.fromServerError(message, statusCode);
}

class CacheException extends AppException {
  const CacheException(super.message);

  @override
  Failure toFailure() => Failure(
    type: FailureType.unknown,
    message: message.isNotEmpty ? message : 'Failed to access cache.',
  );
}

class NetworkException extends AppException {
  const NetworkException(super.message);

  @override
  Failure toFailure() => Failure.networkError();
}

class InvalidInputException extends AppException {
  const InvalidInputException(super.message);

  @override
  Failure toFailure() => Failure.validationError(message);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException(super.message, [super.statusCode]);

  @override
  Failure toFailure() => Failure.fromServerError(message, statusCode);
}

class NotFoundException extends AppException {
  const NotFoundException(super.message, [super.statusCode]);

  @override
  Failure toFailure() => Failure.fromServerError(message, statusCode);
}

class UnknownException extends AppException {
  const UnknownException(super.message);

  @override
  Failure toFailure() => Failure(
    type: FailureType.unknown,
    message: message.isNotEmpty ? message : 'An unknown error occurred.',
  );
}

class TimeoutException extends AppException {
  const TimeoutException(super.message);

  @override
  Failure toFailure() => Failure(
    type: FailureType.network,
    message: message.isNotEmpty
        ? message
        : 'Request timed out. Please try again.',
  );
}

class ValidationException extends AppException {
  const ValidationException(super.message, [super.statusCode]);

  @override
  Failure toFailure() => Failure.fromServerError(message, statusCode);
}

class AuthException extends AppException {
  const AuthException(super.message, [super.statusCode]);

  @override
  Failure toFailure() => Failure.fromServerError(message, statusCode);
}

class PermissionDeniedException extends AppException {
  const PermissionDeniedException(super.message, [super.statusCode]);

  @override
  Failure toFailure() => Failure.fromServerError(message, statusCode);
}

class RateLimitException extends AppException {
  const RateLimitException(super.message, [super.statusCode]);

  @override
  Failure toFailure() => Failure(
    type: FailureType.server,
    message: message.isNotEmpty
        ? message
        : 'Rate limit exceeded. Please try again later.',
    statusCode: statusCode,
  );
}

class ServiceUnavailableException extends AppException {
  const ServiceUnavailableException(super.message, [super.statusCode]);

  @override
  Failure toFailure() => Failure.fromServerError(message, statusCode);
}

class DependencyException extends AppException {
  const DependencyException(super.message);

  @override
  Failure toFailure() => Failure(
    type: FailureType.unknown,
    message: message.isNotEmpty ? message : 'Dependency error occurred.',
  );
}

class DatabaseException extends AppException {
  const DatabaseException(super.message);

  @override
  Failure toFailure() => Failure(
    type: FailureType.unknown,
    message: message.isNotEmpty ? message : 'Database error occurred.',
  );
}

class FileSystemException extends AppException {
  const FileSystemException(super.message);

  @override
  Failure toFailure() => Failure(
    type: FailureType.unknown,
    message: message.isNotEmpty ? message : 'File system error occurred.',
  );
}

class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException(super.message, [super.statusCode]);

  @override
  Failure toFailure() => Failure.fromServerError(message, statusCode);
}

class ResourceNotFoundException extends AppException {
  const ResourceNotFoundException(super.message, [super.statusCode]);

  @override
  Failure toFailure() => Failure.fromServerError(message, statusCode);
}

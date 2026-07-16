import 'exceptions.dart';
import 'failures.dart';

class FailureMapper {
  static Failure mapException(Object e) {
    if (e is AppException) {
      // Already known app exceptions
      return Failure.fromServerError(e.message, e.statusCode);
    } else if (e is Failure) {
      return e;
    } else if (e.toString().contains('SocketException')) {
      return Failure.networkError();
    } else {
      return Failure(
        type: FailureType.unknown,
        message: 'Unexpected error: ${e.toString()}',
      );
    }
  }
}

import 'package:fpdart/fpdart.dart';
import 'package:starter_app/features/splash/model/validate_token_model.dart';

import '../../../core/error/failures.dart';

abstract interface class SplashRepository {
  Future<Either<Failure, ValidateTokenModel>> validateToken({
    required String token,
  });
}

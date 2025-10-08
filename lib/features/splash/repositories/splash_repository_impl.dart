import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/connection/connection_checker.dart';
import '../../../core/constant/api_constant.dart';
import '../../../core/di/injection.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/repository/api_repository.dart';
import '../../../core/network/repository/api_repository_impl.dart';
import '../../../core/utils/isolate_parser.dart';
import '../model/validate_token_model.dart';
import 'splash_repository.dart';

@Injectable(as: SplashRepository)
class SplashRepositoryImpl implements SplashRepository {
  static final SplashRepositoryImpl _instance = SplashRepositoryImpl._internal(
    sl<ConnectionChecker>(),
  );
  final ConnectionChecker connectionChecker;

  factory SplashRepositoryImpl() {
    return _instance;
  }
  SplashRepositoryImpl._internal(this.connectionChecker);
  @override
  Future<Either<Failure, ValidateTokenModel>> validateToken({
    required String token,
  }) async {
    ApiRepository apiRepository = ApiRepositoryImpl(sl.get());
    Map<String, dynamic> data = {'token': token};
    return _validateToken(() async {
      final response = await apiRepository.getWithBody(
        ApiConstants.validateToken,
        data,
      );
      // final user = ValidateTokenModel.fromJson(response['data']);
      final user = await IsolateParser.parse(
        (json) => ValidateTokenModel.fromJson(json),
        response['data'],
      );
      log('ValidateTokenModel: $user');
      return user;
    });
  }

  Future<Either<Failure, ValidateTokenModel>> _validateToken(
    Future<ValidateTokenModel> Function() fn,
  ) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure.networkError());
      }
      final user = await fn();

      return right(user);
    } on ServerException catch (e) {
      return left(Failure.fromServerError(e.message, e.statusCode));
    } catch (e) {
      return left(
        Failure(message: 'An unexpected error occurred: ${e.toString()}'),
      );
    }
  }
}

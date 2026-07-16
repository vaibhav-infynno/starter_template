import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../constant/preference_constant.dart';
import '../../utils/preference_utils.dart';
import 'retry_interceptor.dart';
import 'token_interceptor.dart';

class NetworkInterceptors extends Interceptor {
  final RetryInterceptor retryInterceptor;
  final TokenInterceptor tokenInterceptor;

  NetworkInterceptors({
    required this.retryInterceptor,
    required this.tokenInterceptor,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Append headers without replacing options
    final headers = _headers();
    options.headers.addAll(headers);

    // Optional: Set timeout (you can also set this globally in Dio config)
    options.receiveTimeout = const Duration(milliseconds: 30000);

    // Log headers for debugging
    print('Final headers being sent: ${options.headers}');

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_shouldRetry(err)) {
      handler.resolve(
        await retryInterceptor.scheduleRetryRequest(err.requestOptions),
      );
    } else {
      handler.resolve(
        err.response ??
            Response(
              requestOptions: err.requestOptions,
              statusCode: 403,
              data: {"error": err.error, "error_description": err.message},
            ),
      );
    }
  }

  /// Check if error is due to lost internet
  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.unknown && err.error is SocketException;
  }

  /// Construct dynamic headers including token
  Map<String, String> _headers() {
    Map<String, String> headers = {};

    final token = getString(PreferenceConstant.token);
    log("Token from preference: $token");
    if (token.isNotEmpty) {
      print("Authorization Header Set ===> Bearer $token");
      headers["Authorization"] = 'Bearer $token';
    }

    headers["Content-Type"] = 'application/json';
    return headers;
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../connection/connection_checker.dart';
import '../../constant/api_constant.dart';
import '../../error/exceptions.dart';
import '../interceptor/network_interceptor.dart';
import '../interceptor/retry_interceptor.dart';
import '../interceptor/token_interceptor.dart';
import 'api_repository.dart';

class ApiRepositoryImpl implements ApiRepository {
  final Dio _dio;
  final ConnectionChecker _connectionChecker;

  ApiRepositoryImpl(this._connectionChecker)
    : _dio = Dio(BaseOptions(baseUrl: ApiConstants.appStagingBaseUrl)) {
    _dio.interceptors.add(
      NetworkInterceptors(
        retryInterceptor: RetryInterceptor(
          dio: _dio,
          connectivity: GetIt.I<Connectivity>(),
        ),
        tokenInterceptor: TokenInterceptor(dio: _dio),
      ),
    );
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  Future<Map<String, dynamic>> _makeRequest(
    Future<Map<String, dynamic>> Function() fn,
  ) async {
    if (!await _connectionChecker.isConnected) {
      throw NetworkException('No internet connection');
    }
    try {
      return await fn();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> post(String methodName, dynamic data) async =>
      _makeRequest(
        () => _dio.post(methodName, data: data).then(_returnResponse),
      );

  @override
  Future<Map<String, dynamic>> rawPost(String methodName, dynamic data) async =>
      _makeRequest(
        () => _dio.post(methodName, data: data).then(_returnResponse),
      );

  @override
  Future<Map<String, dynamic>> formPost(String methodName, File data) async {
    return _makeRequest(() async {
      final fileName = data.path.split('/').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(data.path, filename: fileName),
      });
      return _dio.post(methodName, data: formData).then(_returnResponse);
    });
  }

  @override
  Future<Map<String, dynamic>> get(
    String methodName, {
    Map<String, dynamic>? data,
  }) async => _makeRequest(
    () => _dio.get(methodName, queryParameters: data).then(_returnResponse),
  );

  @override
  Future<Map<String, dynamic>> getWithBody(
    String methodName,
    dynamic data,
  ) async => _makeRequest(
    () => _dio.get(methodName, data: data).then(_returnResponse),
  );

  @override
  Future<Map<String, dynamic>> patch(
    String methodName, {
    Map<String, dynamic>? data,
  }) async => _makeRequest(
    () => _dio.patch(methodName, queryParameters: data).then(_returnResponse),
  );

  @override
  Future<Map<String, dynamic>> getWithPath(
    String methodName,
    String path,
  ) async =>
      _makeRequest(() => _dio.get('$methodName$path').then(_returnResponse));

  @override
  Future<Map<String, dynamic>> getAll(String methodName) async =>
      _makeRequest(() => _dio.get(methodName).then(_returnResponse));

  @override
  Future<Map<String, dynamic>> delete(
    String methodName,
    String token,
    String id,
  ) async => _makeRequest(
    () => _dio
        .delete(
          '$methodName/$id',
          options: Options(headers: {'Authorization': 'Bearer $token'}),
        )
        .then(_returnResponse),
  );

  @override
  Future<Map<String, dynamic>> deleteWithPayload(
    String methodName,
    dynamic data,
  ) async => _makeRequest(
    () => _dio.delete(methodName, data: data).then(_returnResponse),
  );

  @override
  Future<Map<String, dynamic>> getPlaces(
    String input,
    bool isMapBox, {
    Map<String, dynamic>? data,
  }) async => _makeRequest(
    () => _dio
        .get(input, queryParameters: isMapBox ? data : null)
        .then(_returnResponse),
  );

  @override
  Future<Map<String, dynamic>> put(
    String methodName,
    Map<String, dynamic>? data,
  ) async => _makeRequest(
    () => _dio.put(methodName, data: data).then(_returnResponse),
  );

  @override
  Future<Map<String, dynamic>> rawPut(
    String methodName,
    String id,
    dynamic data,
  ) async => _makeRequest(
    () => _dio.put('$methodName/$id', data: data).then(_returnResponse),
  );

  Map<String, dynamic> _returnResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return {
        'statusCode': response.statusCode,
        'data': response.data,
        'message': response.statusMessage ?? 'Success',
      };
    }
    String message = 'Server error';
    try {
      if (response.data is String) {
        final decoded = jsonDecode(response.data);
        message = decoded['message'] ?? decoded['error'] ?? message;
      } else if (response.data is Map<String, dynamic>) {
        message = response.data['message'] ?? response.data['error'] ?? message;
      }
    } catch (_) {}
    throw ServerException(message, response.statusCode);
  }

  AppException _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return TimeoutException('Request timed out');
    }
    if (e.type == DioExceptionType.connectionError ||
        e.error is SocketException) {
      return NetworkException('No internet connection');
    }
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      String errorMessage = e.response!.statusMessage ?? 'Unknown error';
      try {
        final data = e.response!.data is String
            ? jsonDecode(e.response!.data)
            : e.response!.data;
        if (data is Map<String, dynamic>) {
          errorMessage = data['message'] ?? data['error'] ?? errorMessage;
        }
      } catch (_) {}
      switch (statusCode) {
        case 400:
          return ValidationException(errorMessage, statusCode);
        case 401:
          return UnauthorizedException(errorMessage, statusCode);
        case 403:
          return PermissionDeniedException(errorMessage, statusCode);
        case 404:
          return NotFoundException(errorMessage, statusCode);
        case 429:
          return RateLimitException(errorMessage, statusCode);
        case 503:
          return ServiceUnavailableException(errorMessage, statusCode);
        default:
          return ServerException(errorMessage, statusCode);
      }
    }
    return UnknownException(e.message ?? 'Unknown Dio error');
  }
}

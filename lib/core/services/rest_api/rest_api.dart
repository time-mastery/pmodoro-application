import "dart:developer";

import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:awesome_dio_interceptor/awesome_dio_interceptor.dart";

part "rest_api.g.dart";

// Custom exception for API errors
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic error;

  ApiException({
    required this.message,
    this.statusCode,
    this.error,
  });

  @override
  String toString() => "ApiException: $message (Status: $statusCode)";
}

@Riverpod(keepAlive: true)
RestApi restApi(Ref ref) {
  final baseUrl = dotenv.env["API"] ?? "";
  log(baseUrl);
  return RestApi(baseUrl);
}

class RestApi {
  final Dio _dio;

  RestApi(String baseUrl) : _dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    _dio.interceptors.add(
      AwesomeDioInterceptor(
        logRequestTimeout: false,
        logRequestHeaders: false,
        logResponseHeaders: false,
        logger: debugPrint,
      ),
    );
  }

  Future<Response<T>> _handleDioError<T>(
      Future<Response<T>> Function() request, String operation) async {
    try {
      return await request();
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw ApiException(
            message: "Connection timeout during $operation operation",
            error: e,
          );
        case DioExceptionType.badResponse:
          throw ApiException(
            message: "Server error during $operation operation",
            statusCode: e.response?.statusCode,
            error: e.response?.data["error"],
          );
        case DioExceptionType.connectionError:
          throw ApiException(
            message: "No internet connection",
            error: e,
          );
        default:
          throw ApiException(
            message: "Error during $operation operation: ${e.message}",
            error: e,
          );
      }
    } catch (e) {
      throw ApiException(
        message: "Unexpected error during $operation operation",
        error: e,
      );
    }
  }

  Future<Response<T>> get<T>(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    return _handleDioError(
      () => _dio.get<T>(endpoint, queryParameters: queryParameters),
      "GET",
    );
  }

  Future<Response<T>> post<T>(String endpoint,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return _handleDioError(
      () =>
          _dio.post<T>(endpoint, data: data, queryParameters: queryParameters),
      "POST",
    );
  }

  Future<Response<T>> put<T>(String endpoint,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return _handleDioError(
      () => _dio.put<T>(endpoint, data: data, queryParameters: queryParameters),
      "PUT",
    );
  }

  Future<Response<T>> delete<T>(String endpoint,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return _handleDioError(
      () => _dio.delete<T>(endpoint,
          data: data, queryParameters: queryParameters),
      "DELETE",
    );
  }
}

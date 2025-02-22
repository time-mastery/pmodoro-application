import "dart:developer";

import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:awesome_dio_interceptor/awesome_dio_interceptor.dart";

part "rest_api.g.dart";

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

  Future<Response<T>> get<T>(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get<T>(endpoint, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw Exception("Failed to GET data: ${e.message}");
    }
  }

  Future<Response<T>> post<T>(String endpoint,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post<T>(endpoint,
          data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw Exception("Failed to POST data: ${e.message}");
    }
  }

  Future<Response<T>> put<T>(String endpoint,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.put<T>(endpoint,
          data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw Exception("Failed to PUT data: ${e.message}");
    }
  }

  Future<Response<T>> delete<T>(String endpoint,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete<T>(endpoint,
          data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw Exception("Failed to DELETE data: ${e.message}");
    }
  }
}

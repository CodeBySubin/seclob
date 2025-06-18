import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:seclob/core/network/api_endpoint.dart';
import 'package:seclob/core/utils/storage_helper.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(Dio dio) : _dio = dio {
    _dio.options = BaseOptions(
      baseUrl: APIConfig.baseURL,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorageHelper.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
            debugPrint("[TOKEN] Bearer $token");
          }

          debugPrint("[API REQUEST] ${options.method} → ${options.uri}");
          if (options.data != null) {
            debugPrint("[BODY] ${options.data}");
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint(
            "[API RESPONSE] ${response.statusCode} ← ${response.requestOptions.uri}",
          );
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          debugPrint("[API ERROR] ${e.message}");
          if (e.response != null) {
            debugPrint(
              "[ERROR RESPONSE] ${e.response?.statusCode} ← ${e.response?.data}",
            );
          }
          return handler.next(e);
        },
      ),
    );
  }

  /// **GET Request**
  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    return _dio.get(endpoint, queryParameters: params);
  }

  /// **POST Request**
  Future<Response> post(String endpoint, {dynamic data}) async {
    return _dio.post(endpoint, data: data);
  }

  /// **PUT Request**
  Future<Response> put(String endpoint, {dynamic data}) async {
    return _dio.put(endpoint, data: data);
  }

  /// **DELETE Request**
  Future<Response> delete(String endpoint, {dynamic data}) async {
    return _dio.delete(endpoint, data: data);
  }
}

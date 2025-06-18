import 'package:dio/dio.dart';

class DioExceptionHandler {
  static AppError handleDioError(DioException error) {
    int? statusCode = error.response?.statusCode;
    String message;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        message = "Connection timed out. Please check your internet.";
        break;
      case DioExceptionType.sendTimeout:
        message = "Request timed out. Try again later.";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Server took too long to respond.";
        break;
      case DioExceptionType.badResponse:
        return handleBadResponse(error);
      case DioExceptionType.cancel:
        message = "Request was cancelled.";
        break;
      case DioExceptionType.connectionError:
        message = "No internet connection.";
        break;
      case DioExceptionType.unknown:
      default:
        message = "Something went wrong. Please try again.";
        break;
    }

    return AppError(message: message, statusCode: statusCode?.toString());
  }

  static AppError handleBadResponse(DioException error) {
    int? statusCode = error.response?.statusCode;
    final data = error.response?.data;
    String message;
    if (data is Map && data.containsKey('message')) {
      message = data['message'];
    } else if (data is String) {
      message = data;
    } else {
      switch (statusCode) {
        case 400:
          message = "Bad request. Please try again.";
          break;
        case 401:
          message = "Unauthorized. Please log in again.";
          break;
        case 403:
          message = "Access denied. You don't have permission.";
          break;
        case 404:
          message = "Resource not found.";
          break;
        case 500:
        default:
          message = "Server error. Please try again later.";
          break;
      }
    }

    return AppError(
      message: message,
      statusCode: statusCode?.toString() ?? "Unknown",
    );
  }
}

class AppError {
  final String message;
  final String? statusCode;
  const AppError({required this.message, this.statusCode});
}

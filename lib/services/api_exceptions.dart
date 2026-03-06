import 'package:dio/dio.dart';
import 'package:test4/services/api_error.dart';

class ApiExceptions {
  static ApiError handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        // Connection timed out while trying to reach the server
        return ApiError(message: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        // Timeout while sending the request
        return ApiError(message: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        // Timeout while receiving the response
        return ApiError(message: 'Receive timeout');
      case DioExceptionType.badCertificate:
        // SSL/TLS certificate is invalid or untrusted
        return ApiError(message: 'Bad certificate');
      case DioExceptionType.badResponse:
        // Server responded with a non-2xx status code
        print(error);
        if (error.response!.data is Map<String, dynamic>) {
          return ApiError(message: error.response!.data['error']['message']);
        } else {
          return ApiError(
            message:
                'Unexpected error: Server responded with a non-2xx status code',
          );
        }
      case DioExceptionType.cancel:
        // Request was cancelled manually
        return ApiError(message: 'Request cancelled');
      case DioExceptionType.connectionError:
        // No internet or connection refused
        return ApiError(message: 'Connection error');
      case DioExceptionType.unknown:
        // Any other unknown error (e.g. SocketException)
        return ApiError(message: 'Unknown error');
    }
  }
}

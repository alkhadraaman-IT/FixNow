import 'package:dio/dio.dart';

class NetworkExceptions {
  static String getErrorMessage(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          return 'No internet connection. Please check your network and try again.';

        case DioExceptionType.badResponse:
          return _extractServerMessage(error.response);

        case DioExceptionType.cancel:
          return 'Request was cancelled.';

        default:
          return 'An unexpected error occurred. Please try again later.';
      }
    }
    return error.toString();
  }

  static String _extractServerMessage(Response? response) {
    
    if (response?.data is Map<String, dynamic>) {
      final data = response!.data as Map<String, dynamic>;

      if (data.containsKey('detail')) {
        final detail = data['detail'];
        if (detail is String && detail.isNotEmpty) {
          return detail; 
        }
      }
    }

    switch (response?.statusCode) {
      case 400:
      case 401:
        return 'Invalid credentials. Please check your input.';
      case 403:
        return 'You do not have permission to perform this action.';
      case 404:
        return 'The requested resource was not found.';
      case 500:
        return 'Server error. Please try again later.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}

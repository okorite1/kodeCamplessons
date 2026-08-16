import 'package:dio/dio.dart';

/// A custom Dio interceptor that logs network requests/responses
/// and provides user-friendly error messages for API failures.
class NetworkInterceptor extends Interceptor {
  /// Called when a request is about to be sent.
  /// Logs the HTTP method and full URL of the outgoing request.
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // Print request details for debugging purposes
    print('REQUEST: ${options.method} ${options.uri}');

    // Pass the request to the next interceptor or to the server
    handler.next(options);
  }

  /// Called when a successful response is received.
  /// Logs the status code and the URL of the original request.
  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    // Print response details for debugging purposes
    print(
      'RESPONSE: ${response.statusCode} ${response.requestOptions.uri}',
    );

    // Pass the response to the next interceptor or to the caller
    handler.next(response);
  }

  /// Called when an error occurs during the request.
  /// Handles HTTP status codes and provides user-friendly error messages.
  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    String message;

    // Map HTTP status codes to user-friendly messages
    switch (err.response?.statusCode) {
      case 400:
        message = 'Bad request.';
        break;

      case 401:
        message = 'Unauthorized. Please login again.';
        break;

      case 403:
        message = 'You do not have permission to access this resource.';
        break;

      case 404:
        message = 'Recipes not found.';
        break;

      case 500:
        message = 'Server error. Please try again later.';
        break;

      default:
        // Fallback message for network issues or unknown status codes
        message = 'Unable to connect to the server.';
    }

    // Log the error message for debugging
    print('API ERROR: $message');

    // Create a new DioException with the user-friendly error message
    // Preserve the original request options, response, type, and stack trace
    final newError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: message, // Replace original error with user-friendly message
      stackTrace: err.stackTrace,
    );

    // Pass the modified error to the next interceptor or to the caller
    handler.next(newError);
  }
}

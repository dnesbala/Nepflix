class RestApiException implements Exception {
  final String message;

  RestApiException({
    required this.message,
  });
}

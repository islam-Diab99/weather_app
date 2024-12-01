class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => message;
}

class NoInternetException extends AppException {
  const NoInternetException() : super('No internet connection available');
}

class CityNotFoundException extends AppException {
  const CityNotFoundException() : super('City not found');
}

class ServerException extends AppException {
  const ServerException() : super('Server error occurred');
}

class UnexpectedException extends AppException {
  const UnexpectedException(super.message);
}

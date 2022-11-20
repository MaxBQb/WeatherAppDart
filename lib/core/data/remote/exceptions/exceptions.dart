class ServerException implements Exception {}

class InternetException implements Exception {}

class AuthenticationException implements Exception {}

class UnexpectedException implements Exception {}

class LocationException implements Exception {
  final String message;
  LocationException(this.message);
}

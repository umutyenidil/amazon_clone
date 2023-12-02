part of 'auth_service.dart';

class AuthServiceResponse {
  final AuthServiceResponseStatus status;
  final String? message;

  AuthServiceResponse({required this.status, this.message});
}

enum AuthServiceResponseStatus {
  successful,
  failed,
  notValidated,
}

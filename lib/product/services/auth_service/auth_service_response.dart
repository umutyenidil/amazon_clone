part of 'auth_service.dart';

class AuthServiceResponse {
  final AuthServiceResponseStatus status;
  final String? message;
  final UserModel? user;

  AuthServiceResponse({required this.status, this.message, this.user});
}

enum AuthServiceResponseStatus {
  successful,
  failed,
}

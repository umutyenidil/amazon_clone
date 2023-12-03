part of 'user_service.dart';

class UserServiceResponse {
  final UserServiceResponseStatus status;
  final String? message;
  final UserModel? user;

  UserServiceResponse({required this.status, this.message, this.user});
}

enum UserServiceResponseStatus {
  successful,
  failed,
}

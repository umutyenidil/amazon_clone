part of 'admin_service.dart';

class AdminServiceResponse {
  final AdminServiceResponseStatus status;
  String? message;

  AdminServiceResponse({
    required this.status,
    this.message,
  });
}

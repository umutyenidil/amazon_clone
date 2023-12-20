part of 'admin_service.dart';

class AdminServiceResponse {
  final AdminServiceResponseStatus status;
  String? message;
  List<ProductModel>? products;

  AdminServiceResponse({
    required this.status,
    this.message,
    this.products,
  });
}

import 'dart:io';
import 'package:amazon_clone/product/models/add_product_form_model.dart';
import 'package:amazon_clone/product/models/product_model.dart';
import 'package:amazon_clone/product/services/auth_service/auth_service.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;

part '_response.dart';

part '_enums.dart';

class AdminService {
  AdminService._();

  static final AdminService instance = AdminService._();

  final String _apiAddres = 'http://192.168.145.85:3000/api/admin/';

  /// returns AuthServiceResponse
  ///
  /// AuthServiceResponse.status == AuthServiceResponseStatus.successful then
  ///
  /// AuthServiceResponse.user : null
  ///
  /// AuthServiceResponse.message : null
  ///
  ///
  /// AuthServiceResponse.status == AuthServiceResponseStatus.failed then
  ///
  /// AuthServiceResponse.user : null
  ///
  /// AuthServiceResponse.message : string
  // Future<AuthServiceResponse> signUp(SignUpFormModel signUpFormData) async {
  //   try {
  //     Uri url = Uri.parse('$_apiAddres/sign-up');
  //
  //     http.Response response = await http.post(
  //       url,
  //       body: signUpFormData.toJson(),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //
  //     Map<String, dynamic> responseBody = jsonDecode(response.body);
  //
  //     if (response.statusCode == 200) {
  //       return AuthServiceResponse(status: AuthServiceResponseStatus.successful);
  //     }
  //
  //     return AuthServiceResponse(status: AuthServiceResponseStatus.failed, message: responseBody[responseBody.keys.first]);
  //   } catch (exception) {
  //     return AuthServiceResponse(status: AuthServiceResponseStatus.failed, message: exception.toString());
  //   }
  // }

  Future<AdminServiceResponse> sellProduct({
    required AddProductFormModel formData,
    required String xAuthToken,
  }) async {
    try {
      final cloudinary = CloudinaryPublic('db19mlyxs', 'pkupger2');

      List<String> imageUrls = [];

      for (File image in formData.productImages) {
        CloudinaryResponse cloudinaryResponse = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(
            image.path,
            folder: formData.productName,
          ),
        );

        imageUrls.add(cloudinaryResponse.secureUrl);
      }

      ProductModel product = ProductModel(
        categoryId: formData.categoryId,
        name: formData.productName,
        description: formData.productDescription,
        price: formData.productPrice,
        quantity: formData.productQuantity.toDouble(),
        images: imageUrls,
      );

      Uri url = Uri.parse('$_apiAddres/product/add');

      http.Response response = await http.post(
        url,
        body: product.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': xAuthToken,
        },
      );

      return AdminServiceResponse(
        status: AdminServiceResponseStatus.successful,
      );
    } catch (exception) {
      return AdminServiceResponse(
        status: AdminServiceResponseStatus.failed,
        message: exception.toString(),
      );
    }
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:amazon_clone/product/models/sign_up_form_model.dart';

part 'auth_service_response.dart';

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  final String _apiAddres = 'http://192.168.169.85:3000/api';

  Future<AuthServiceResponse> signUp(SignUpFormModel signUpFormData) async {
    try {
      Uri url = Uri.parse('$_apiAddres/sign-up');

      http.Response response = await http.post(
        url,
        body: signUpFormData.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return AuthServiceResponse(status: AuthServiceResponseStatus.successful);
      }

      return AuthServiceResponse(status: AuthServiceResponseStatus.failed, message: responseBody[responseBody.keys.first]);
    } catch (exception) {
      return AuthServiceResponse(status: AuthServiceResponseStatus.failed, message: exception.toString());
    }
  }
}

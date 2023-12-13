import 'dart:convert';
import 'package:amazon_clone/product/models/sign_in_form_model.dart';
import 'package:amazon_clone/product/models/user_model.dart';
import 'package:http/http.dart' as http;

import 'package:amazon_clone/product/models/sign_up_form_model.dart';

part 'auth_service_response.dart';

// todo: service icindeki api url'lerini bir enum altinda topla
class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  final String _apiAddres = 'http://192.168.145.85:3000/api/auth';

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

  Future<AuthServiceResponse> signIn(SignInFormModel signInFormData) async {
    try {
      Uri url = Uri.parse('$_apiAddres/sign-in');

      http.Response response = await http.post(
        url,
        body: signInFormData.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return AuthServiceResponse(status: AuthServiceResponseStatus.successful, user: UserModel.fromMap(responseBody));
      }

      return AuthServiceResponse(status: AuthServiceResponseStatus.failed, message: responseBody[responseBody.keys.first]);
    } catch (exception) {
      return AuthServiceResponse(status: AuthServiceResponseStatus.failed, message: exception.toString());
    }
  }

  Future<AuthServiceResponse> isUserAuthenticated(String xAuthToken) async {
    try {
      Uri url = Uri.parse('$_apiAddres/user-authentication');

      http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': xAuthToken,
        },
      );

      Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 && responseBody['isAuthenticated']) {
        return AuthServiceResponse(status: AuthServiceResponseStatus.authenticated);
      }

      return AuthServiceResponse(status: AuthServiceResponseStatus.notAuthenticated);
    } catch (exception) {
      return AuthServiceResponse(status: AuthServiceResponseStatus.failed, message: exception.toString());
    }
  }
}

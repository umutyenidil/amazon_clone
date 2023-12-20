import 'package:amazon_clone/product/app_config/app_config.dart';
import 'package:amazon_clone/product/services/auth_service/auth_service.dart';
import 'package:http/http.dart' as http;

import 'package:amazon_clone/product/models/user_model.dart';

part 'user_service_response.dart';

// todo: service icindeki api url'lerini bir enum altinda topla
class UserService {
  UserService._();

  static final UserService instance = UserService._();

  final String _apiAddres = '${AppConfig.instance.endPoint}/api/user';

  Future<UserServiceResponse> getUserData(String xAuthToken) async {
    try {
      AuthServiceResponse authServiceResponse = await AuthService.instance.isUserAuthenticated(xAuthToken);

      if (authServiceResponse.status == AuthServiceResponseStatus.authenticated) {
        Uri url = Uri.parse('$_apiAddres/data');

        http.Response response = await http.get(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': xAuthToken,
          },
        );

        return UserServiceResponse(status: UserServiceResponseStatus.successful, user: UserModel.fromJson(response.body));
      }

      return UserServiceResponse(status: UserServiceResponseStatus.failed);
    } catch (exception) {
      return UserServiceResponse(status: UserServiceResponseStatus.failed, message: exception.toString());
    }
  }
}

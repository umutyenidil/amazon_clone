import 'package:amazon_clone/product/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? getCurrentUser() {
    return _user;
  }

  void setCurrentUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}

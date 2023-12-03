import 'package:shared_preferences/shared_preferences.dart';

part '_exceptions.dart';

part '_keys.dart';

class SharedPreferencesManager {
  SharedPreferences? _sharedPreferences;

  SharedPreferencesManager._();

  static final SharedPreferencesManager instance = SharedPreferencesManager._();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  _initializationCheck() {
    if (_sharedPreferences == null) throw SharedPreferencesNotInitializedException;
  }

  Future<void> saveString(SharedPreferencesKeys key, String value) async {
    _initializationCheck();
    await _sharedPreferences?.setString(key.name, value);
  }

  Future<String?> getString(SharedPreferencesKeys key) async {
    _initializationCheck();
    return _sharedPreferences?.getString(key.name);
  }

  Future<void> removeItem(SharedPreferencesKeys key) async {
    _initializationCheck();
    await _sharedPreferences?.remove(key.name);
  }
}

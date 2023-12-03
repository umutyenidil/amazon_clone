part of 'shared_preferences_manager.dart';

class SharedPreferencesNotInitializedException implements Exception {
  @override
  String toString() {
    return 'SharedPreferences not initialized';
  }
}

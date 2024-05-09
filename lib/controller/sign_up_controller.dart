import 'package:app1/core/storage/cache_manager.dart';

class SignupController {
  Future<bool> saveData(
    String firstName,
    String lastName,
    String userName,
    String password,
  ) async {
    try {
      // Save String values.
      CacheManager.saveData(key: 'fName', value: firstName);
      CacheManager.saveData(key: 'lName', value: lastName);
      CacheManager.saveData(key: 'user', value: userName);
      CacheManager.saveData(key: 'pass', value: password);
      return true;
    } catch (error) {
      print('Error Message; $error');
      return false;
    }
  }
}

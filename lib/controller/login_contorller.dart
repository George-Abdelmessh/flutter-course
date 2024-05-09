import 'dart:async';

import 'package:app1/core/storage/cache_manager.dart';

class LoginController {
  String? _userName;
  String? _password;

  Future<void> _fillData() async {
    try {
      _userName = CacheManager.getDate(key: 'user');
      _password = CacheManager.getDate(key: 'pass');
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<bool> login(String userName, String password) async {
    await _fillData();

    if (userName == _userName && password == _password) {
      return true;
    } else {
      return false;
    }
  }
}

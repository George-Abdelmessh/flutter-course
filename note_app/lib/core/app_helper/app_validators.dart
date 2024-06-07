class AppValidators {
  static String? required({required String? value, String? error}) {
    if (value == null || value.isEmpty) {
      return error ?? 'Required';
    } else {
      return null;
    }
  }

  // RegExp
  static String? email({String? value, String? error}) {
    if (value == null || value.isEmpty) {
      return error ?? 'Required';
    }
    if (!value.contains('@')) {
      return 'Email is not valid';
    }
    final List<String> spilt = value.split('@');
    if (spilt.length != 2 || spilt.contains('')) {
      return 'Email is not valid';
    }
    return null;
  }
}

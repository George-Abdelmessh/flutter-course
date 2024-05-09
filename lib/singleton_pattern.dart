class CallMeSingleton {

  /// Private Static Instance
  static CallMeSingleton? _callMeSingleton;

  /// Private Named Constratctor
  CallMeSingleton._();

  /// instance Return Method
  static CallMeSingleton getInstance()  {
    // ignore: prefer_conditional_assignment
    if (_callMeSingleton == null) {
      _callMeSingleton = CallMeSingleton._();
    }
    return _callMeSingleton!;
  }
}


import 'package:flutter/widgets.dart';

class ToDoListController extends ChangeNotifier {
  List<String> tasks = [];

  void addTask() {
    tasks.add('Task ${tasks.length + 1}');
    notifyListeners();
  }
}

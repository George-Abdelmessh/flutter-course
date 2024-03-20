import 'dart:io';

List<Map> tasks = [
  {
    "id": 1,
    "name": 'Gym',
    "is_done": false,
    "duration": '50 M',
  },
  {
    "id": 2,
    "name": 'Work',
    "is_done": false,
    "duration": '30 M',
  },
  {
    "id": 3,
    "name": 'Gym',
    "is_done": false,
    "duration": '20 M',
  },
];

void getUserOption() {
  print(
    "please Choose Option: \n1.Show Tasks\n2.Add Task \n3.Edit Task \n4.Mark As Done \n5.Search \n6.Delete Task",
  );
  final String? option = stdin.readLineSync();
  switch (option) {
    case '1':
      showTasks();
    case '2':
      addTask();
    case '3':
      editTask();
    case '4':
      markAsDone();
    case '5':
      searchForATask();
    case '6':
      deleteTask();
    case 'exit':
      print('Exit');
    default:
      print('invalid Option');
  }
}

void showTasks() {
  // for (int i = 0; i < tasks.length; i++) {
  //   print("id: ${tasks[i]['id']}");
  //   print("name: ${tasks[i]['name']}");
  //   print("is done: ${tasks[i]['is_done']}");
  //   print("duration: ${tasks[i]['duration']}");
  //   print('-------------------------');
  // }

  tasks.forEach((task) {
    printTask(task);
  });

  /// Call Get user Option [getUserOption]
  getUserOption();
}

void addTask() {
  print('Enter Task Name: ');
  final String? name = stdin.readLineSync();
  print('Enter Task Duration in M: ');
  final String? duration = stdin.readLineSync();

  tasks.add(
    {
      "id": tasks.length + 1,
      "name": name,
      "is_done": false,
      "duration": '$duration M',
    },
  );
  showTasks();
}

void deleteTask() {
  print('Enter Task ID: ');
  final int? id = int.tryParse(stdin.readLineSync()!);
  tasks.removeWhere((task) => task['id'] == id);
  showTasks();
}

void markAsDone() {
  print('Enter Task ID: ');
  final int? id = int.tryParse(stdin.readLineSync()!);
  for (int i = 0; i < tasks.length; i++) {
    if (id == tasks[i]['id']) {
      tasks[i]['is_done'] = true;
      break;
    }
  }
  showTasks();
}

void searchForATask() {
  /// 1- kyeSen.
  /// 2- subString
  print('Enter Task Name: ');
  final String name = stdin.readLineSync()!;
  tasks.forEach((task) {
    if (task['name'].toString().toLowerCase().contains(name.toLowerCase())) {
      printTask(task);
    }
  });
  getUserOption();
}

void editTask() {
  print('Enter Task ID: ');
  final int? id = int.parse(stdin.readLineSync()!);
  for(int i = 0; i< tasks.length; i++) {
    if(id == tasks[i]['id']) {
      print('Choose 1.Name OR 2.Duration ');
      final String option = stdin.readLineSync()!;
      if(option == '1'){
        print('Enter Task Name: ');
        final String name = stdin.readLineSync()!;
        tasks[i]['name'] = name;
      } else if(option == '2') {
        print('Enter Task Duration: ');
        final String duration = stdin.readLineSync()!;
        tasks[i]['duration'] = duration;
      } else {
        print('Invalid Option');
      }
      break;
    }
  }
  showTasks();
}

void printTask(Map task) {
  print('*********************');
  print("id: ${task['id']}");
  print("name: ${task['name']}");
  print("is done: ${task['is_done']}");
  print("duration: ${task['duration']}");
  print('**********************');
}
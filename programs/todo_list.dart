import 'dart:io';

/// Initializes a list of tasks with predefined values.
List<Map> tasks = [
  {
    "id": 1,
    "name": 'Gym',
    "is_done": false,
    "duration": '50 M',
  }
];

/// Displays user options for task management and processes user input.
/// It allows users to select from showing tasks, adding a new task, editing an existing task,
/// marking a task as done, searching for tasks, or deleting a task.
void getUserOption() {
  print(
    "please Choose Option: \n1.Show Tasks\n2.Add Task \n3.Edit Task \n4.Mark As Done \n5.Search \n6.Delete Task",
  );
  final String? option = stdin.readLineSync(hello
  switch (option) {
    case '1':
      showTasks();
    case '2':
      addTask();
    case '3':
      editTaskEnhancement();
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

/// Displays all tasks in the tasks list.
/// Each task's details are printed out, including ID, name, completion status, and duration.
/// After displaying, it prompts the user again for an option selection.
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

/// Allows the user to add a new task.
/// The user is prompted to enter the task name and duration. A new task is then added to the tasks list with these details.
/// After adding, it shows all tasks including the newly added one.
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

/// Enables the user to delete a task based on its ID.
/// The user is prompted for the task ID to delete, and if found, the task is removed from the list.
/// After deletion, it shows the updated list of tasks.
void deleteTask() {
  print('Enter Task ID: ');
  final int? id = int.tryParse(stdin.readLineSync()!);
  tasks.removeWhere((task) => task['id'] == id);
  showTasks();
}

/// Allows the user to mark a task as done based on its ID.
/// The user provides the task ID, and if the task is found, its 'is_done' status is set to true.
/// After marking as done, it shows the updated tasks list reflecting the change.
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

/// Facilitates task search based on name.
/// The user enters a task name or part of it, and the function searches for and displays all matching tasks.
/// After displaying found tasks, it prompts the user again for an option selection.
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

/// Provides functionality to edit a task's name or duration based on its ID.
/// After selecting a task by ID, the user can choose to update either its name or duration.
/// The task list is updated accordingly, and then all tasks are shown again.
void editTask() {
  print('Enter Task ID: ');
  final int? id = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < tasks.length; i++) {
    if (id == tasks[i]['id']) {
      print('Choose 1.Name OR 2.Duration');
      final String option = stdin.readLineSync()!;
      if (option == '1') {
        print('Enter Task Name: ');
        final String name = stdin.readLineSync()!;
        tasks[i]['name'] = name;
      } else if (option == '2') {
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

/// Enhanced version of task editing, allowing for more flexible updates.
/// After identifying a task by ID, the user can directly input a new name or duration, or skip each by entering an empty input.
/// The task list is updated based on provided inputs, and then all tasks are shown.
void editTaskEnhancement() {
  print('Enter Task ID: ');
  final int? id = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < tasks.length; i++) {
    if (id == tasks[i]['id']) {
      print('Enter Name OR Skip');
      final String? name = stdin.readLineSync();
      if (name!.isNotEmpty) {
        tasks[i]['name'] = name;
      }
      print('Enter Duration OR Skip');
      final String? duration = stdin.readLineSync();
      if (duration!.isNotEmpty) {
        tasks[i]['duration'] = duration;
      }
      break;
    }
  }
  showTasks();
}

/// Prints the details of a given task.
/// It outputs the task's ID, name, completion status, and duration.
void printTask(Map task) {
  print('*********************');
  print("id: ${task['id']}");
  print("name: ${task['name']}");
  print("is done: ${task['is_done']}");
  print("duration: ${task['duration']}");
  print('**********************');
}

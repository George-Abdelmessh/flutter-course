import 'dart:io';


final List<Map<String, dynamic>> contacts = [
  {
    "id": 0,
    "name": {
      "first_name": 'Geo',
      "last_name": 'jo',
    },
    "numbers": {
      "+20106235558",
      "+20106233558",
    },
    "email": 'Geo@gm.com'
  },
];

void displayContacts() {
  contacts.forEach((item) {
    item.forEach((key, value) {
      if (key == 'name') {
        value.forEach((localKey, localValue) {
          print('$localKey: $localValue');
        });
      } else if (key == 'numbers') {
        value.forEach((localValue) {
          print('$key: $localValue');
        });
      } else {
        print("$key: $value");
      }
    });
  });
  showOptions();
}

void showOptions() {
  print(
      'Please Choose Option: \n1.show\n2.Add\n3.Edit\n4.Delete\n5.Search\n6.Sort \nOR Exit');
  final String option = stdin.readLineSync()!;

  if (option == '1') {
    displayContacts();
  } else if (option == '2') {
    addContact();
  } else if (option == '3') {
    editContact();
  } else if (option == '4') {
    deleteContact();
  } else if (option == '5') {
    ///
  } else if (option == '6') {
    sort();
  } else if (option.toLowerCase() == 'exit') {
    print('End');
  } else {
    print('Invalid Option');
  }
}

void addContact() {
  print('Please Enter First Name: ');
  final String firstName = stdin.readLineSync()!;
  print('Please Enter Last Name: ');
  final String lastName = stdin.readLineSync()!;
  print('Please Enter Email: ');
  final String email = stdin.readLineSync()!;
  print('Please Enter Number: ');
  String number = stdin.readLineSync()!;

  final Set numbers = {};

  while (number.isNotEmpty) {
    numbers.add(number);
    print('Please Enter Number: ');
    number = stdin.readLineSync()!;
  }

  contacts.add({
    "id": contacts.length + 1,
    "name": {
      "first_name": firstName,
      "last_name": lastName,
    },
    "numbers": numbers,
    "email": email
  });
  displayContacts();
}

void editContact() {
  print('Please Enter Contact ID: ');
  final int? id = int.tryParse(stdin.readLineSync()!);
  for (int i = 0; i < contacts.length; i++) {
    if (id == contacts[i]['id']) {
      print('Enter First Name OR Skip');
      final String? firstName = stdin.readLineSync();
      if (firstName!.isNotEmpty) {
        contacts[i]['name']['first_name'] = firstName;
      }

      print('Enter Last Name OR Skip');
      final String? lastName = stdin.readLineSync();
      if (lastName!.isNotEmpty) {
        contacts[i]['name']['last_name'] = lastName;
      }

      print('Enter email OR Skip');
      final String? email = stdin.readLineSync();
      if (email!.isNotEmpty) {
        contacts[i]['email'] = email;
      }

      /// ToDo Enhancement
      final Set localSet = contacts[i]['numbers'];
      for (int y = 0; y < localSet.length; y++) {
        print('Selected Number To Edit: ${localSet.elementAt(y)}');
        print('Enter Number OR Skip');
        final String? number = stdin.readLineSync();
        if (number!.isNotEmpty) {
          localSet.remove(localSet.elementAt(y));
          localSet.add(number);
        }
      }

      break;
    }
  }
  displayContacts();
}

void sort() {
  contacts.sort(
    (item1, item2) =>
        item1['name']['first_name'].compareTo(item2['name']['first_name']),
  );
  displayContacts();
}

void deleteContact() {
  print('Please Enter Contact ID: ');
  final int? id = int.tryParse(stdin.readLineSync()!);
  contacts.removeWhere((item) => id == item['id']);
  displayContacts();
}

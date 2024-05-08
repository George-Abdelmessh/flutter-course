/// Loops (for, while, do while, forEach)
/// Collection Data Types [List, Maps, Set] {}
/// Loops (forEach)
/// EXCEPTION HANDLING => try catch finally
/// Intro To OOP

// on UnsupportedError
// throw Exception_name() => FormatException
//''.codeUnits property
//''.runes property
//''.codeUnitAt

void main() {
  /// Loops
  // final String? name = stdin.readLineSync();
  //
  // while (name != 'exit') {
  //   name = stdin.readLineSync();
  //   print(name);
  // }

  // do {
  //   name = stdin.readLineSync();
  //   print(name);
  // } while (name != 'exit');

  // String? name = 'exit';
  //
  // print(name.codeUnits);

  /// Collection Data Types [List]
  // int num0 = 0;
  // int num1 = 1;
  // int num2 = 2;
  // int num3 = 3;
  // int num4 = 4;
  // int num5 = 5;
  // List number = [0, 1, 2, 3, 4, 5];
  //
  // List<String> names = ['Geo', 'Ali'];
  // List<String> newUsers = ['Ahmed', 'Omar'];

  // List<int> numbers = List.generate(100, (count) {
  //   return num(count);
  // });

  // List<int> numbers = List.generate(20, (count) => num(count));

  // print(numbers);

  // for(int i= 0; i< numbers.length ; i++) {
  //   print(numbers[i]);
  // }

  // print(numbers[1]);
  // /// ...
  // print(numbers[99]);

  // print(names.length);
  // print(names.reversed);
  // print(names.isNotEmpty);
  // print(numbers.isEmpty);
  // print(numbers.length == 0);
  // print(names.first);
  // print(names.last);
  // names.add('Ahmed');
  // names.addAll(newUsers);
  // names.addAll(['Ahmed', 'Omar']);
  // names.insert(1,'Omar');
  // names[0] = 'George';
  // print(names);

  // print(names[0]);
  // print(names[1]);
  // print(names[2]);
  // print(names[4]);
  // print(names.e);
  // print(names.length);
  // print(num(0));

  /// const vs final
  // const List<int> numbers = [];
  // final List<int> numbers = [];
  // numbers = [];
  // print(numbers);
  // numbers.add(0);
  // numbers.add(1);
  // numbers.add(2);
  // print(numbers.contains(10));
  // // numbers.clear();
  // print(numbers);

  /// Collection Data Types [Maps] {}
  // Map<int, String> names = {
  //   2: "Ali",
  //   7: "Ahmed",
  //   3: "7mo2a",
  //   6: "7mo2a",
  //   1: "Geo",
  // };
  //
  // Map<String, String> codes = {
  //   "Eg": "+2",
  //   "USA": "+1",
  //   "E": "+5",
  //   "R": "+5",
  // };

  // print(names[1]);
  // print(codes['Eg']);
  // print(codes.length);
  // print(codes.values);
  // print(codes.entries);
  // print(codes.keys);
  // codes.removeWhere((key, value) => key == 'E');
  // codes.removeWhere((key, value) => value == '+5');
  // codes.addAll({
  //   "": "",
  //   "d": "",
  //   "f": "",
  //   "g": "",
  // });
  // codes.addEntries([
  //   MapEntry('key0', 'value'),
  //   MapEntry('key1', 'value'),
  //   MapEntry('key', 'V'),
  // ]);
  //
  // Map code = codes.map((key, value) {
  //   print(key);
  //   return MapEntry(key, value);
  // });
  //
  // print(code);

  /// Collection Data Types [Set] {}
  // List<int> list = [0, 1, 2, 3, 3, 3, 3];
  // Set<int> set = {0, 1, 2, 3};
  // Set<int> set = {0, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3};

  // print(list);
  // set
  // print(set.first);
  // print(set.toList());

  /// foreach
  // List<int> list = [0, 1, 2, 3, 3, 3, 3];
  // Set<int> set = {0, 1, 2, 3};
  // Map<String, String> codes = {
  //   "Eg": "+2",
  //   "USA": "+1",
  //   "E": "+5",
  //   "R": "+5",
  // };

  // codes.forEach((key, value) {
  //   print('$key : $value');
  // });

  // String name = 'Geo';
  // List<String> letters = List.generate(name.length, (index) => name[index]);


  // letters.add(name[0]);
  // letters.add(name[1]);
  // letters.add(name[2]);
  // print(letters);
  // print(name[0]);
  // for(int i = 0; i < list.length; i++) {
  //   print(list[i]);
  // }

  /// EXCEPTION HANDLING => try catch finally
  // int num1 = 10;
  // int num2 = 0;
  //
  // try {
  //   int result = num1 ~/ num2;
  //   print(result);
  // } catch (error) {
  //   print('Error: $error');
  // } finally {
  //   ///
  //   ///
  //   ///
  //   print('Done');
  // }
  //
  //
  // print('Hello');
  //
}

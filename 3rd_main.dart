//''.codeUnits property
//''.runes property
//''.codeUnitAt
/// Functions => Built in Vs User Defined
/// Function return vs void
/// Function Parameter
/// Function Overloading -> Task * Not supported
/// Conditional Statement (if, if else, else)
/// Ternary Operator ? :
/// Switch
/// Control statement => Break & Continue
///
/// Loops (for, while, do while, forEach)
/// Collection Data Types [List, Maps, Set]
/// EXCEPTION HANDLING
/// Intro To OOP
// on UnsupportedError
// throw Exception_name() => FormatException

/// Function
/// ? => allow null, ! => null check, ?? => if null
// void main() {
//   // int result = sum(10, 30);
//   // int result = sum( num2: 100,  50);
//   // print(result);
// }

/// 1- define function => data type, function name () {}
/// 2- write function body
/// 3- call function => function name  ();
// double sum () {
//   double result = 10 + 15;
//   return result;
// }

// int sum(int num1, int num2) {
//   int result = num1 + num2;
//   return result;
// }

// int sum({
//   int num1 = 10,
//   int num2 = 30,
// }) {
//   int result = num1 + num2;
//   return result;
// }

// int sum(int x, {
//   int? num1,
//   required int num2,
//   int num3 = 30,
// }) {
//   int result = num1 ?? 0 + num2;
//   return result;
// }

// int num1 = 10;

void main() {
  /// iF condition
  // if (num1 > num2) {
  //   print("num1 > num2");
  // } else if (num1 < num2) {
  //   print("num1 < num2");
  // } else if (num1 != num2) {
  //   print("num1 = num2");
  // } else {
  //   print("i don't know");
  // }

  /// Ternary Operator ? :
  // int? num1;
  // num1 = 0;
  // // int num2 = 0;
  // int num2 = (num1 != null ) && (num1 != 0 || num1 == 20) ? 100 : 0;

  // if (num1 != 0 || num1 == 20) {
  //   num2 = 20;
  // } else {
  //   num2 = 10;
  // }
  // print(num2);

  /// Switch
  // print('Choose team member name: Geo, Ali, Ahmed');
  // String? name = stdin.readLineSync();
  // switch (1) {
  //   case 1:
  //
  //   case 2:
  //     print("two");
  // }
  // switch (name) {
  //   case 'Geo':
  //     print('The Selected Team Member is Geo');
  //   case 'Ali':
  //     print('The Selected Team Member is Ali');
  //   case '7mada':
  //     break;
  //   case 'Ahmed':
  //     print('The Selected Team Member is Ahmed');
  //   default:
  //     print('You Entered $name, Not Found');
  // }

  // if (name == 'Geo') {
  //   print('The Selected Team Member is Geo');
  // } else if (name == 'Ali') {
  //   print('The Selected Team Member is Ali');
  // } else if (name == 'Ahmed') {
  //   print('The Selected Team Member is Ahmed');
  // } else {
  //   print('You Entered $name, Not Found');
  // }

  /// i = 0;
  /// x = ++i; -> 1
  /// x = i++; -> 0

  /// Loops (for, while, do while, forEach)
  /// for => counter; condition; incremental ++i i++

  // print('Enter Number');
  // int? count = int.parse(stdin.readLineSync()!);
  // print('Choose team member name: Geo, Ali, Ahmed');
  // String? name = stdin.readLineSync();
  //
  // for(int i = 0; i <= count; i++) {
  //   if(name != 'Geo' && name != 'Ali' && name != 'Ahmed') {
  //     print('Not Found, try again!');
  //     name = stdin.readLineSync();
  //   } else {
  //     break;
  //   }
  // }

  // print('Enter user name: ');
  // String? name = stdin.readLineSync();
  // print('Enter password: ');
  // String? password = stdin.readLineSync();
  //
  // while (name != 'Geo' || password != '123') { // true
  //   print('Not Found, try again!');
  //   name = stdin.readLineSync();
  //   password = stdin.readLineSync();
  // }
  // print('login: $name');

  /// Control statement => Break & Continue
  // print('Enter Number Less Than 8: ');
  // int? count = int.parse(stdin.readLineSync()!);
  // for (int i = 0; i <= count; i++) {
  //   if (i == 3) {
  //     continue;
  //     print(i);
  //   }
  //   print(i);
  // }

  // print('Enter Number Less Than 8: ');
  // int? count = int.parse(stdin.readLineSync()!);
  //
  // for (int i = 0; i <= count; i++) {
  //   if (i == 8) {
  //     break;
  //   }
  //   print(i);
  // }
  // print('Done');
}


/// user input stdin.readLineSync()
/// Casting ()
/// Naming convention
/// final vs const
/// Operators[Arithmetic(+ - * / ++ -- %), Assignment(= += -= *= ), Comparison(== != > < >= <=), Logical(& | !)]
/// Functions *** not Completed


// import 'dart:io';

void main() {
  /// User input
  // int currentYear = 2024;
  // print("Please enter your Birth year:");
  // int? birthYear = int.parse(stdin.readLineSync()!);
  // int age = currentYear - birthYear;
  // print("Your Age is $age");
  /// to print run time data type
  // print(age.runtimeType);
  /// Casting
  // print(10.toString().runtimeType);
  // print(10.toDouble().runtimeType);
  // print(10.0.toInt().runtimeType);
  /// Naming Convention
  // String userName = 'George';
  // int age = 24;

  /// final vs const
  // int num = 15;
  // const int age2 = 25;
  // final int age1 = age2;
  //

  /// Arithmetic
  // int num1 = 2;
  // int num2 = 65;
  // final int sum = num2 + num1;
  // final int sub = num2 - num1;
  // final int mul = num2 * num1;
  // final double div = num2 / num1;
  // final double mod = num2 % num1;
  // int finalResult = div.toInt();
  // print(num2 % num1);

  /// Assignment = += -= *=
  // int num1 = 2;
  // num1 += 50; // => num1 = num1 + 50;
  // num1 -= 50; // => num1 = num1 - 50;
  // num1 *= 50; // => num1 = num1 * 50;
  // print(num1);

  /// Comparison(== != > < >= <=)
  // String user1 = 'Geo';
  // String user2 = 'Ali';

  // bool result = user1 == user2;
  // bool result = user1 != user2;
  // bool result = user1.length > user2.length;
  // bool result = user1.length < user2.length;
  // bool result = user1.length >= user2.length;
  // bool result = user1.length <= user2.length;
  // print(result);

  /// Logical(& | !) AND(&&), OR(||), NOT(!) => `true` or `false`
  // String user1 = 'Geo';
  // String user2 = 'Ali';
  // bool result = user1.length <= user2.length || user1.length > user2.length;
  // bool result = user1.length <= user2.length && user1.length == user2.length;
  // bool result = !(user1.length <= user2.length);
  // bool result = !(user1.length < user2.length);
  // print(result);

  /// Function
  // printHelloWorld();
  // print(5.toDouble());

  /// String Functions
  final String name = "AAc";
  final String name2 = "AA";
  print(name.toUpperCase());
  print(name.toLowerCase());
  print(name.split(' '));
  print(name.contains('A'));
  print(name.replaceFirst('A', 'B'));
  print(name.replaceAll('A', 'c'));
  print(name.compareTo(name2));
}

/// 1- define function => data type, function name
/// 2- write function body
/// 3- call function
void printHelloWorld() {
  String message = "Hello World";
  print(message);
}


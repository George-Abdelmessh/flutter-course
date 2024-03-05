// Compiler vs interpreter
// Syntax
// main function ** Entry point
// semicolon 
// Output
// var valible
// comment
// Errors
// import


/*
add function, to create var x it = 5
 then x plus 1 
*/

// void add() {
//   var x = 5;
//   ++x;
// }


// void main () {
//   /// [name]
//   var name;
//   var age = 15; 
//   name = "george";
//   // george
//   print(name);

//   name = "ahmed";
//   // ahmed
//   print(name);

//   age = 23;
//   // 23 hehle snkshgifudhsb iu
//   print(age);
// }

// int X = 10;

// void main() {
//   var b = 5 + 5;
//   // 10
//   var x = 10;
//   // 20
//   b = x + b;
//   print(b);
//   //28
//   b = 8 + b;
//   var y = 'x'  + 5;
//   print(y);
// }

// 5 m
// var => 2m


// import 'dart:io';

// import 'lib/variables.dart';

/// ToDo read null safety docs
/// ToDo handle user input data 

// void main() {
  
//   int? age;

//   // print(age);
//   // print(name);
//   // print('Enter your name: ');
//   // String name = stdin.readLineSync();
//   print('Enter your age: $age');
//   // stdin.readLineSync();
// }

import 'dart:io'; 
  
void main() 
{ 
    int number = int.parse(stdin.readLineSync()!); 
    print("The number is $number"); 
}
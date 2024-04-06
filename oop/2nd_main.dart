
/// OOP
/// Class
/// Attributes and Methods.
/// Object
/// Constructor
/// Encapsulation
/// Setter
/// Getter
///

/// Features Of OOP
/// 1- Class
/// 2- Object
/// 3- Encapsulation
/// ----------------
/// 4- Inheritance
/// 5- Polymorphism
/// 6- Abstraction

/// --------------------------
/// Constant Constructor
/// Inheritance
/// Super
/// Polymorphism
/// Static
/// Destructor
///
/// Abstraction

// class Point {
//   final int? x;
//   final int? y;
//
//   const Point(this.x, this.y);
// }

class Person {
  int? id;
  String? name;
  int? age;

  Person(this.id, this.name, this.age);

  void display() {
    print('id: $id');
    print('Name: $name');
    print('Age: $age');
  }
}

// class CEO extends Person{
//   int? exp;
//
//   // CEO (int age, int id, String name, this.exp) : super(id, name, age);
//   CEO (super.id, super.name, super.age, this.exp) ;
//
//   void displayExp() {
//     super.display();
//     print('exper: $exp');
//   }
// }

// class Worker extends Person{
//   bool? inchurance;
//
//   void displayInc() {
//     print('incure: $inchurance');
//   }
// }

// class Car {
//   String? name;
//   String? price;
// }
//
// class Tesla extends Car {
//   void display() {
//     print('Name: $name');
//     print('price: $price');
//   }
// }
//
// class Model3 extends Tesla {
//   String? color;
//
//  void displayColor(){
//    print('Color: $color');
//  }
// }
//
// class BMW extends Car {
//   void display() {
//     print('Name: $name');
//     print('price: $price');
//   }
// }

// class Shape {
//   double? diameter1;
//   double? diameter2;
//
//   Shape() {
//     print('Shape');
//   }
//
//   void displayArea() {
//     print(diameter1! * diameter2!);
//   }
// }
//
// class Rectangle extends Shape {
//   // Rectangle() {
//   //   print('Rectangle');
//   // }
//   @override
//   void displayArea() {
//     print(diameter1! * diameter2!);
//   }
// }
//
// class Triangle extends Shape {
//   @override
//   void displayArea() {
//     print(0.5 * diameter1! * diameter2!);
//   }
// }
//
// class Employee {
//   void displaySalary() {
//     print("Employee Salary is 2000\$");
//   }
// }
//
// class Manager extends Employee {
//   @override
//   void displaySalary() {
//     print("Manager Salary is 5000\$");
//   }
// }
//
// class Developer extends Employee {
//   @override
//   void displaySalary() {
//     print("Developer Salary is 3000\$");
//   }
// }

class Employee {
  static int? count = 0;
  String? name;
  int? salary;

  void totalEmployee() {
    print('Total Employee: $count');
  }

  void showDetails() {
    print('Total Employee: $count');
    print('name: $name');
    print('salary: $salary');
  }

  // static void displayName() {
  //   print(name);
  // }

  void dispose() {
    count = null;
    name = null;
    salary = null;
  }
}

void main() {
  // Employee.name = 'Jo';
  // // Employee.displayName();
  // Employee e1 = Employee();
  // Employee.displayName();
  // Employee.displayName();
  // Employee.displayName();
  // Employee.name = 'g';
  // Employee.displayName();

  Employee e1 = Employee();
  Employee.count = 1;
  e1.name = 'JJ';
  e1.salary = 2000;
  Employee e2 = Employee();
  Employee.count = 2;
  e2.name = 'RR';
  e2.salary = 5000;

  e1.showDetails();
  e1.dispose();
  e1.showDetails();
  // Employee e4 = Employee();
  // e4.totalEmployee();

  // CEO p1 = CEO(10, 'name', 20, 10);
  // p1.display();
  // p1.displayExp();

  // final Point p1 = const Point(0, 1);
  // final Point p2 = const Point(0, 1);
  // print(p1.hashCode);
  // print(p2.hashCode);

  // final CEO geo = CEO();
  // geo.name = 'George';
  // geo.age = 23;
  // geo.id = 5555;
  // geo.exp = 10;
  // geo.display();
  // geo.displayExp();
  // print('*---------*');
  // final Worker worker1 = Worker();
  // worker1.name = 'Ali';
  // worker1.age = 30;
  // worker1.id = 3333;
  // worker1.inchurance = true;
  // worker1.display();
  // worker1.displayInc();

  // final Tesla t1 = Tesla();
  // final Model3 t1 = Model3();
  //
  // t1.name = 'Tesla Model 3';
  // t1.price = '50000';
  // t1.color = 'White';
  // t1.display();
  // t1.displayColor();

  // final Tesla bmw = Tesla();
  // bmw.name = 'BMW E40';
  // bmw.price = '120000';
  // bmw.display();
  //
  // final Triangle tr = Triangle();
  // tr.diameter1 = 20.0;
  // tr.diameter2 = 10.0;
  // tr.displayArea();

  // final Rectangle re = Rectangle();
  // re.diameter1 = 20.0;
  // re.diameter2 = 10.0;
  // re.displayArea();

  // final Manager m1 = Manager();
  // final Developer d1 = Developer();
  // m1.displaySalary();
  // d1.displaySalary();
}

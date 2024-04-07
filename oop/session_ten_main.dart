/// Factory constructor
/// Abstraction
/// Interface
/// Enum

// class Person {
//   String? firstName;
//   String? lastName;
//
//   // final int? x ;
//
//   factory Person() {
//     return Person();
//   }

// Person(this.firstName, this.lastName);
//
// factory Person.formMap(Map<String, dynamic> data) {
//
//   // final fName = data['fName'];
//   // final lName = data['lName'];
//   return Person(data['fName'], data['lName']);
// }

// Person() {
//   print('Default');
// }

// Person.formMap(this.x) {
//   print('Named Const');
// }
// }

// abstract class Vehicle {
//   // int model;
//   // Vehicle(this.model);
//   void start();
//   void stop();
//   String get make;
// }
//
// class Car extends Vehicle {
//   // Car(super.model);
//
//
//   @override
//   String start() {
//     print('Start Car');
//     return '';
//     // print(super.model);
//   }
//
//   @override
//   void stop() {
//     print('Stop Car');
//   }
//
//   @override
//   String get make => 'Bmw';
// }

// class Bike extends Vehicle {
//   // Bike(super.model);
//
//   @override
//   void start() {
//     print('Bike Car');
//     // print(super.model);
//   }
//
//   @override
//   void stop() {
//     print('Bike Car');
//   }
// }

// enum Gender {
//   Male,
//   Female,
// }
//
// enum Status {
//   pending,
//   completed,
//   rejected,
// }
//
//
// class Person {
//   String? firstName;
//   String? lastName;
//   Gender? gender;
//   Person(this.firstName, this.lastName, this.gender);
//
//   void display() {
//     print("First Name: $firstName");
//     print("Last Name: $lastName");
//     print("Gender: ${gender!.index}");
//   }
// }

void main() {
  // for (var state in Status.values) {
  //   print(state);
  // }

  // Person p1 = Person('firstName', 'lastName');
  // Person p2 = Person.formMap({
  //   'fName': 'Geo',
  //   'lName': 'Jo',
  // });
  //
  // print(p2.firstName);
  // print(p2.lastName);

  // Car c = Car();
  // c.start();
  // c.stop();

  // Bike b = Bike();
  // b.start();
  // b.stop();

  // Person p1 = Person('Ali', 'Ramdan', Gender.Male);
  // p1.display();
  // Person p2 = Person('Aya', 'Mohamed', Gender.Female);
  // p2.display();
}

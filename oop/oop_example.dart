/// Class
/// Object
/// Constructor
/// Polymorphism
/// Inheritance
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void describe() {
    print("I am $name and my is $age");
  }
}

class Bird extends Animal {
  int speed;

  // Bird(this.speed, String name, int age) : super(name, age);
  Bird(this.speed, super.name, super.age);

  @override
  void describe() {
    super.describe();
    print('Bird Speed: $speed');
  }
}

class Fish extends Animal {
  String waterType;
  Fish(this.waterType, super.name, super.age);

  @override
  void describe() {
    super.describe();
    print('Water type is: $waterType');
  }
}

/// -----------------------------------
abstract class Shape {
  const Shape();
  double area();
  void draw();
}

class Circle extends Shape {
  final double radius;

  const Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }

  @override
  void draw() {
    print('Drawing a Circle with radius $radius');
  }
}

class Square extends Shape {
  final double side;

  const Square(this.side);

  @override
  double area() => side * side;

  @override
  void draw() {
    print('Drawing a Square with side $side');
  }
}

class Rectangle extends Shape {
  final double width;
  final double height;

  const Rectangle(this.width, this.height);

  @override
  double area() => width * height;

  @override
  void draw() {
    print('Drawing Rectangle with Width $width and Height $height');
  }
}

/// ---------------------
class Car {
  String? name;
}

class Tesla extends Car {
  void display() {
    print('name: $name');
  }
}

class Model3 extends Tesla {
  double? price;
}

void main() {
  List<Animal> animals = [
    Animal('loin', 3),
    Bird(50, 'Parrot', 2),
    Fish('fresh', 'GoldFish', 1),
  ];

  for (var animal in animals) {
    animal.describe();
  }

  // /// 20 10
  // final Rectangle r1 = Rectangle();
  // r1.width = 20;
  // r1.height = 10;
  //
  // print(r1.area);

  // List<Shape> shapes = [
  //   Circle(30),
  //   Square(20),
  //   Rectangle(20, 30),
  // ];
  //
  // for(var shape in shapes) {
  //   print('Area: ${shape.area()}');
  //   shape.draw();
  // }
}

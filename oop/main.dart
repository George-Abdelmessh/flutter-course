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
/// 2- Encapsulation
/// ----------------
/// 4- Inheritance
/// 5- Polymorphism
/// 6- Abstraction


/// class ClassName {}
class Car {
  String? color;
  int? hoursPower;
  int? model;
  String? brand;
  String? _cost;

  // Car({this.brand, this.color, this.hoursPower, this.model});

  Car({
    required String brandName,
    required String carColor,
    required int power,
    required int carModel,
  }) {
    print('Def Constrctor');
    this.color = 'Color: $carColor';
    this.brand = 'Brand: $brandName';
    this.hoursPower = power;
    this.model = carModel;
    this._cost = '500.000 EGP';
  }

  Car.setDataFromMap(Map<String, dynamic> data) {
    print('Named Constrctor');
    this.color = data['color'];
    this.brand = data['brand'];
    this.model = data['model'];
    this.hoursPower = data['power'];
  }

  // set cost (String newCost) {
  //
  //   this._cost = newCost + ' EGP';
  // }

  set cost (String newCost) => this._cost = newCost + ' EGP';

  // String get finalCoat {
  //   return _cost!;
  // }

  String get finalCoat => _cost!;


  void _displayCost() {
    print(_cost);
  }

  // Car({
  //   required String brandName,
  //   required String carColor,
  //   int? power,
  //   int? carModel,
  // }) {
  //   print('Constructor Called ');
  //   brand = brandName;
  //   color = carColor;
  //   hoursPower = power;
  //   model = carModel;
  // }

  void setCarData({
    required String brandName,
    required String carColor,
    int? power,
    int? carModel,
  }) {
    brand = brandName;
    color = carColor;
    hoursPower = power;
    model = carModel;
  }

  void display(String role) {
    print(color);
    print(hoursPower);
    print(model);
    print(brand);
    if(role == 'admin') {
      _displayCost();
    }
  }
}

void main() {
  // Car car = Car(brandName: brandName, carColor: carColor, power: power, carModel: carModel);
  // car._displayCost();
  // final String carName = 'BMW';
  // final String carColor = 'Red';
  // final int carModel = 2024;
  // final int power = 300;
  //
  // final Map<String, dynamic> data = {
  //   "color": 'blue',
  //   "model": 2024,
  //   "power": 500,
  //   "brand": "Tesla",
  // };

  // Car? car1;
  //
  // print('Choose Car [Tesla, BMW]: ');
  // final String? option = stdin.readLineSync();
  //
  // if (option!.toLowerCase() == 'tesla') {
  //   car1 = Car.setDataFromMap(data);
  //   car1.display();
  // } else if (option.toLowerCase() == 'bmw') {
  //   car1 = Car(
  //     carColor: carColor,
  //     power: power,
  //     brandName: carName,
  //     carModel: carModel,
  //   );
  //   car1.display();
  // } else {
  //   print('invalid option');
  // }

  // Car car1 = Car.display();

  // car1.displayColor(); // red

  // Car car2 = Car();
  // car1.display();
  // print('********');
  // car1.setCarData('Jac', 'Blue', 400, 2024);
  // car1.display();
  // print('///////////////');
  // car2.setCarData('Tesla', 'White', 550, 2023);
  // car2.display();
  // print('############');
  // car1.display();
}

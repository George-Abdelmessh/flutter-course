// class Car {
//   String color = 'red';
//   int hoursPower = 500;
//   int model = 2022;
//   String barend = 'BMW';
// }

import 'main.dart';

void main () {
  Car car1 = Car(brandName: 'BMW', carColor: 'Green', power: 500, carModel: 2022);
  car1.model = 2025;
  // car1.model = 2025;

  car1.display('Data Entry');
  // car1.cost('700.000 EGP');
  // car1.cost = '700.000';
  // print(car1.finalCoat);
  // car1.display('admin');
  // car1.display('admin');

}


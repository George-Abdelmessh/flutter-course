import 'book.dart';
import 'member.dart';
import 'purchase.dart';

void main() {
  final Book b1 = Book(serialNumber: '000', title: 'Albrt', author: 'Ali');
  final Book b2 = Book(serialNumber: '001', title: 'Alex', author: 'Ahmed');
  final Book b3 = Book(serialNumber: '002', title: 'Jack', author: 'Omar');
  final Book b4 = Book(serialNumber: '003', title: 'Mac', author: 'Aya');

  final Member m1 = Member('Mohamed', '10');
  m1.borrowBook(b1);
  m1.borrowBook(b4);
  m1.displayInfo();

  print('***************************');

  final Member m2 = Member('Ali', '5');
  m2.userId = '12';
  m2.borrowBook(b1);
  m2.borrowBook(b2);
  m2.displayInfo();

  print('***************************');

  final Member m3 = Member('Jo', '3');
  m3.borrowBook(b1);
  m3.borrowBook(b3);
  m3.displayInfo();

  print('***************************');

  Purchase.displayInfo();
}

import 'book.dart';
import 'purchase.dart';
import 'user.dart';

class Member extends User {
  List<Book> booksBorrowed = [];

  Member(super.name, super.userId);

  void borrowBook(Book book) {
    booksBorrowed.add(book);
    Purchase.count += 1;
  }

  @override
  void displayInfo() {
    super.displayInfo();
    booksBorrowed.forEach((element) {
      print('Book Name: ${element.title}');
    });
  }
}

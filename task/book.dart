class Book {
  final String serialNumber;
  final String title;
  final String author;

  Book({
    required this.serialNumber,
    required this.title,
    required this.author,
  });

  void displayInfo() {
    print('Serial number: $serialNumber');
    print('Title: $title');
    print('Author: $author');
  }
}

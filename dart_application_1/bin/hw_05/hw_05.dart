/*class book{
String? _title;
String? _author;
double _raiting = 0.0;

book(String title, String author){
_title = title;
_author = author;
}

book.withRaiting(String title, String author, double raiting ){
_raiting = raiting;
}
}

String get _title => title;
String get _*/

class Book {
  String _title;
  String _author;
  double _rating;

  Book(this._title, this._author) : _rating = 0.0;

  Book.withRating(this._title, this._author, double rating) : _rating = 0.0 {
    setRating(rating);
  }

  String get title => _title;
  String get author => _author;
  double get rating => _rating;

  void setRating(double rating) {
    if (rating >= 0 && rating <= 10) {
      _rating = rating;
    } else {
      print('Ошибка: рейтинг должен быть от 0 до 10');
    }
  }

  void displayInfo() {
    print('Title: $_title');
    print('Author: $_author');
    print('Rating: $_rating');
  }
}

class Library {
  String name;
  final List<Book> _books = [];

  Library(this.name);

  void addBook(Book b) {
    _books.add(b);
  }

  void showBooks() {
    print('Library: $name');
    print('Books List');
    for (int i = 0; i < _books.length; i++) {
      print('${i + 1}. ${_books[i].title}');
    }
  }

  int get booksCount => _books.length;
}

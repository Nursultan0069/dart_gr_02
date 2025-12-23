import 'hw_05.dart';
void main() {
  Book book1 = Book('Harry Potter', 'J.K. Rowling');
  book1.setRating(9.5);
  book1.displayInfo();

  print('---');

  Book book2 = Book.withRating('2006', 'Taalaybekov Nursultan', 9.0);
  book2.displayInfo();


  Library library = Library('City Library');

  library.addBook(Book.withRating('Harry Potter', 'J.K. Rowling', 8.0));
  library.addBook(Book.withRating('Sherlock Holmes', 'Arthur Conan Doyle', 8.4));

  library.showBooks();
  
  


  Book book3 = Book('Harry Potter', 'J.K. Rowling');

  Book book4 = Book.withRating('Sherlock Holmes', 'Arthur Conan Doyle', 9.0);

  
  Book book5 = Book('1984', 'George Orwell');
  book3.setRating(8.7);

  
  Library cityLib = Library('City Library');

  
  cityLib.addBook(book3);
  cityLib.addBook(book4);
  cityLib.addBook(book5);

  
  cityLib.showBooks();


  print('Total books in library: ${cityLib.booksCount}');
}



